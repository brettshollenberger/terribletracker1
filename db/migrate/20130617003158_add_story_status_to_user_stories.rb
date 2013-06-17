class AddStoryStatusToUserStories < ActiveRecord::Migration
  def change
    add_column :user_stories, :story_status, :string, default: "Unstarted"
  end
end
