# 修改后 必须重启
# subscribe/unsubscribed 属于回调方法
class RoomChannel < ApplicationCable::Channel
  def subscribed
    # 全局性的
    stream_from "room_channel"     # 名称 要对应 RoomChannel
    stream_from "room_channel_user_#{message_user.id}"   # 每个用户订阅id不一样
    
    # stream_for message_user        # 一个对象 stream_for for for for 注意啦
    # RoomChannel.broadcast_to(User.first, message: 'kkko')      model 方式

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
