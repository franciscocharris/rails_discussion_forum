class AddDiscussionIdAndUserIdToReplies < ActiveRecord::Migration[6.1]
  def change
    add_reference :replies, :discussion, null: false, foreign_key: true
    add_reference :replies, :user, null: false, foreign_key: true
  end
end
