class MessagesController < ApplicationController
  before_action :logged_in_user
  before_action :get_messages

  def index
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      #PS: 1、广播失败自动忽略(比如：没有频道),返回nil
      #    2、rails c 中不可广播（都没有log)

      # broadcast 方式一
      ActionCable.server.broadcast 'rom_channel',
                                    message: render_message(message)
      # broadcast 方式二（strem_for)
      RoomChannel.broadcast_to(User.last, object_message: true)

      message.mentions.each do |user|
        ActionCable.server.broadcast "room_channel_user_#{user.id}",
                                      mention: true
      end

    end
  end

  private

    def get_messages
      @messages = Message.for_display
      @message  = current_user.messages.build
    end

    def message_params
      params.require(:message).permit(:content)
    end

    def render_message(message)
      render partial: 'message', locals: {message: message}
    end
end
