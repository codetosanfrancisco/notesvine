class AddImportanceToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :importance, :integer
  end
end
