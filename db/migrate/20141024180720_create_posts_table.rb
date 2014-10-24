class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :description_source
      t.text :link
      t.timestamps
    end
  end
end
