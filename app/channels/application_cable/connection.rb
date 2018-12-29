module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # 不能在 订阅中直接使用 current_user
    include SessionsHelper

    # identified_by action_cable 内置方法（属性访问器）
    identified_by :message_user

    def connect
      self.message_user = find_verified_user
      # 订阅中 可直接用 message_user
    end

    private

      def find_verified_user
        if logged_in?
          current_user
        else
          reject_unauthorized_connection # action cable 内置方法
        end
      end
  end
end
