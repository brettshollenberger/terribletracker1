class RemoveClientIdFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :client_id
  end

  def down
    add_column :projects, :client_id, :integer, null: false
  end
end
