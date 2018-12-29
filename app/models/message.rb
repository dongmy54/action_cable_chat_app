class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(50) }

  # @的用户id
  def mentions
    content.scan(/@(#{User::NAME_REGEX})/).flatten.map do |user_name|
      User.find_by_username(user_name)
    end.compact      # 这里还能串方法
  end

end
