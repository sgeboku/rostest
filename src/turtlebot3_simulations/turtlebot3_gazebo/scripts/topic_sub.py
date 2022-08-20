#! /usr/bin/env python3

import rospy    #ROSに必要な基本的な機能を読み込む
from std_msgs.msg import Int32  #トピックに送るメッセージの定義を読み込む

def callback(msg):
    """ callback関数：購読するときに実行させる関数

        引数にmsgとあるが，関数を指定するときは特に引数を渡すことはない．
        自動的に購読対象を引数とする．

    """
    print(msg.data) #購読したメッセージのdataという変数に格納されているものを表示


rospy.init_node('topic_subscriber') #'topic_subscriber'という名前でノードを新規作成（初期化）

sub = rospy.Subscriber('counter', Int32, callback)  #'counter', Int32のトピックを購読し，実行させる関数をcallbackに設定
sub2 = rospy.Subscriber('det_state', Int32, callback)  #'counter', Int32のトピックを購読し，実行させる関数をcallbackに設定

rospy.spin()    #継続して処理をさせる．while not is_shutdown()のショートカットといえる