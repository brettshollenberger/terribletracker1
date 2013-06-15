class ChangeUserIdToDeveloperId < ActiveRecord::Migration
  def up
    remove_column :user_stories, :user_id
    add_column :user_stories, :developer_id, :integer, null: false
  end

  def down
    remove_column :user_stories, :developer_id
    add_column :user_stories, :user_id, :integer, null: false
  end
end
