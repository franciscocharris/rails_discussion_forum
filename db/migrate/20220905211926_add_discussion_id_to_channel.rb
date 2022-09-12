class AddDiscussionIdToChannel < ActiveRecord::Migration[6.1]
  def change
    add_reference :channels, :discussion, null: false, foreign_key: true
  end
end
