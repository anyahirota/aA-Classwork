class EditResponses < ActiveRecord::Migration[5.2]
  def change
    rename_column :responses, :user_id, :answerererer_id
  end
end
