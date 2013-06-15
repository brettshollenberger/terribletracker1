class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.integer :budget
      t.integer :weekly_rate
      t.datetime :due_date
      t.integer :client_id, null: false

      t.timestamps
    end
  end
end
