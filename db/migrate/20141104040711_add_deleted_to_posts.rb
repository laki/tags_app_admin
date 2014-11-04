class AddDeletedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :deleted, :boolean, default: false
    add_index :posts, :deleted
  end
end
