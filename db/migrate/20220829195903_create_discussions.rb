class CreateDiscussions < ActiveRecord::Migration[6.1]
  def change
    create_table :discussions do |t|
      t.string :tittle
      t.text :content

      t.timestamps
    end
  end
end
