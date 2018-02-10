class AddForeignKeyToTemperatures < ActiveRecord::Migration[5.0]
  def change
    add_column :tasklists, :board_id, :integer
  end
end
