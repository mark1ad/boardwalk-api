class ChangeTaskDescription < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :description, :text, :default => "", :null => false
  end
end
