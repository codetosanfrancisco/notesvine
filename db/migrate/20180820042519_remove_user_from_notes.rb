class RemoveUserFromNotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :notes,:user_id,:integer
  end
end
