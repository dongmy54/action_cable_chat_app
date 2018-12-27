# 修改后 必须重启
# subscribe/unsubscribed 属于回调方法
class RoomChannel < ApplicationCable::Channel
  def subscribed
    # 全局性的
    stream_from "room_channel"     # 名称 要对应 RoomChannel
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
