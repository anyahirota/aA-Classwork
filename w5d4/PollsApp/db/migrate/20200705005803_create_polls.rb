class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.integer :user_id
      t.string :title
    end
    add_index :polls, :user_id
  end
end
