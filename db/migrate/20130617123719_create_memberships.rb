class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id, null: false
      t.integer :project_id, null: false
      t.string :role, null: false

      t.timestamps
    end
  end
end
