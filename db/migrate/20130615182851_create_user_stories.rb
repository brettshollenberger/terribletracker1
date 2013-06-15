class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :title, null: false
      t.text :content
      t.integer :estimate
      t.integer :project_id, null: false
      t.integer :user_id, null: false
      t.integer :complexity

      t.timestamps
    end
  end
end
