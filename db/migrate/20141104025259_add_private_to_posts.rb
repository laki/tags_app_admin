class AddPrivateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_private, :boolean, default: false
    add_index :posts, :is_private
  end
end
