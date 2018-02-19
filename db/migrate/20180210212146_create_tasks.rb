class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :tasklist_id

      t.timestamps
    end
  end
end
