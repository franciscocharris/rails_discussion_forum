class AddChannelIdToDiscussions < ActiveRecord::Migration[6.1]
  def change
    add_reference :discussions, :channel, null: false, foreign_key: true
  end
end
