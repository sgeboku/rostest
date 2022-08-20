#! /usr/bin/env python3

import rospy    #ROSに必要な基本的な機能を読み込む
from std_msgs.msg import Int32  #トピックに送るメッセージの定義を読み込む

rospy.init_node('topic_publisher')  #'topic_publisher'という名前でノードを新規作成（初期化）

pub = rospy.Publisher('counter', Int32) #'counter'という名前で，送るメッセージの型をInt32に設定  ←公開
gomi = rospy.Publisher('img_state', Int32) #'counter'という名前で，送るメッセージの型をInt32に設定  ←公開

#####ここまでで，トピックは公開される．以下はトピックを使って送るメッセージについて

rate = rospy.Rate(2)    #2Hz(1秒間に2回)でメッセージを送る

count = 0   #送るメッセージを格納する変数
while not rospy.is_shutdown():
    pub.publish(count)
    gomi.publish(0)
    count += 1  #毎回1増やす（カウント）
    rate.sleep()    #指定したrate(いまは2Hz)で実行されるために十分な時間をスリープする