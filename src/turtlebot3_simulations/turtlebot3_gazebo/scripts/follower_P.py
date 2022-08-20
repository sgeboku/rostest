#! /usr/bin/python3.8

import rospy, cv_bridge #ROSとOpenCV間でデータを受け渡すためのパッケージ
import cv2 as cv
import numpy as np
from sensor_msgs.msg import Image
from geometry_msgs.msg import Twist
from std_msgs.msg import Int32  #トピックに送るメッセージの定義を読み込む

class Follower:
    def __init__(self):
        self.bridge = cv_bridge.CvBridge()
        self.error_sum = 0
        cv.namedWindow('BGR Image', 1)  #'BGR Image'という名前の画像表示のウィンドウを作成
        cv.namedWindow('MASK', 1)   #'MASK'という名前の画像表示のウィンドウを作成
        cv.namedWindow('MASKED', 1) #'MASK'という名前の画像表示のウィンドウを作成
        self.image_sub = rospy.Subscriber('camera/rgb/image_raw', Image, self.image_callback)   #Image型で画像トピックを購読し，コールバック関数を呼ぶ
        self.cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size = 1)
        self.det_state_sub = rospy.Subscriber('det_state', Int32, self.state_callback)  #'counter', Int32のトピックを購読し，実行させる関数をcallbackに設定
        self.img_state_pub = rospy.Publisher('img_state', Int32, queue_size = 1) #'counter'という名前で，送るメッセージの型をInt32に設定  ←公開

        self.twist = Twist()    #Twistインスタンス生成

    def state_callback(self, msg):
        print(msg.data) #購読したメッセージのdataという変数に格納されているものを表示

    def image_callback(self, msg):
        image = self.bridge.imgmsg_to_cv2(msg, desired_encoding = 'bgr8')

        # hsv = cv.cvtColor(image, cv.COLOR_BGR2HSV)  #色空間の変換(BGR→HSV)
        # lower_yellow = np.array([10, 10, 10])       #黄色の閾値（下限）
        # upper_yellow = np.array([255, 255, 250])    #黄色の閾値（上限）

        lower_yellow = np.array([0, 200, 200])       #黄色の閾値（下限）
        upper_yellow = np.array([70, 255, 255])    #黄色の閾値（上限）
        mask = cv.inRange(image, lower_yellow, upper_yellow)  #閾値によるBGR画像の2値化（マスク画像生成）
        masked = cv.bitwise_and(image, image, mask = mask)  #mask画像において，1である部分だけが残る（フィルタに通している）

        h, w = image.shape[:2]
        RESIZE = (w//3, h//3)
        search_top = (h//4)*0
        search_bot = search_top + h   #目の前の線にだけに興味がある→20行分くらいに絞る
        mask[0:search_top, 0:w] = 0
        mask[search_bot:h, 0:w] = 0

        M = cv.moments(mask)    #maskにおける1の部分の重心
        print(M['m00'])

        # kaiten
        if M['m00'] > 0:    #重心が存在する
            cx = int(M['m10']/M['m00']) #重心のx座標
            cy = int(M['m01']/M['m00']) #重心のy座標
            ##P制御
            err = cx - w//2 #黄色の先の重心座標(x)と画像の中心(x)との差
            self.error_sum = self.error_sum + err
            self.twist.angular.z = -(float(err)/1000 + self.error_sum/10000)#誤差にあわせて回転速度を変化させる（-1/1000がP制御でいうところの比例ゲインにあたる）
            # cyokushin
            if M['m00'] < 20000000:    
                self.twist.linear.x = 0.5
            else:
                cv.imwrite("yello_box.jpg", image)
                self.twist.linear.x = 0
                print("chokusihin stop")
            cv.circle(image, (cx, cy), 20, (0, 0, 255), -1) #赤丸を画像に描画
            self.img_state_pub.publish(1)
        else:
            self.twist.linear.x = 0
            self.twist.linear.z = 0
            self.img_state_pub.publish(0)
            print("not detect")


        self.cmd_vel_pub.publish(self.twist)


        #大きすぎるため，サイズ調整
        display_mask = cv.resize(mask, RESIZE)
        display_masked = cv.resize(masked, RESIZE)
        display_image = cv.resize(image, RESIZE)

        #表示
        cv.imshow('BGR Image', display_image)   #'BGR Image'ウィンドウにimageを表示
        cv.imshow('MASK', display_mask)         #'MASK'ウィンドウにimageを表示
        cv.imshow('MASKED', display_masked)     #'MASKED'ウィンドウにimageを表示
        cv.waitKey(3)   #3ミリ秒待つ

rospy.init_node('follower') #'follower'という名前でノードを初期化
follower = Follower()   #Followerクラスのインスタンスを作成（init関数が実行される）
rospy.spin()    #ループ