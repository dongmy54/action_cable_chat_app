module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include SessionsHelper     # 可用 current_user 方法

    # identified_by action_cable 内置方法（属性访问器）
    identified_by :message_user

    def connect
      self.message_user = find_verified_user
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
