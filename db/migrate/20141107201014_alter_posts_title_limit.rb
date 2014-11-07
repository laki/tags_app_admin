class AlterPostsTitleLimit < ActiveRecord::Migration
  def change
    change_column :posts, :title, :string, null: false, limit: 100
  end
end
