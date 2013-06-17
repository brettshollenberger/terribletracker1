class RemoveDeveloperIdFromUserStories < ActiveRecord::Migration
  def up
    remove_column :user_stories, :developer_id
  end

  def down
    add_column :user_stories, :developer_id, :integer, null: false
  end
end
