class AddRemarkToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes,:remark,:text
  end
end
