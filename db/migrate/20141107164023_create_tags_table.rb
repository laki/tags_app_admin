class CreateTagsTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false, limit: 50
      t.string :slug, null: false, limit: 50
      t.timestamps
    end

    add_index :tags, :slug, unique: true
  end
end
