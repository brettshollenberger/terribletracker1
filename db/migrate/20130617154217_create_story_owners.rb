class CreateStoryOwners < ActiveRecord::Migration
  def change
    create_table :story_owners do |t|
      t.integer :user_id, null: false
      t.integer :user_story_id, null: false

      t.timestamps
    end
  end
end
