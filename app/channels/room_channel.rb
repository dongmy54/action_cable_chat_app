# 服务端 建立频道
# PS: 修改后,必须重启
class RoomChannel < ApplicationCable::Channel

  def subscribed
    stream_from "room_channel"                           # 常量 所有人订阅 全局
    stream_from "room_channel_user_#{message_user.id}"   # 变量 仅对应用户订阅
    stream_for message_user                              # model对象 对应用户端 代表对象订阅

    # 1、客户端订阅规则：客户端环境下,上面订阅的频道参数
    # 2、客户端一旦连接,会自动订阅，sever有log
    
    # log 如下：
    # RoomChannel is streaming from room_channel
    # RoomChannel is transmitting the subscription confirmation
    # RoomChannel is streaming from room_channel_user_2

    # RoomChannel.broadcast_to(User.first, message: 'kkko')      model 方式

  end

  def unsubscribed
  end
end
