class RenamePostTagsToTaggings < ActiveRecord::Migration
  def change
    rename_table :post_tags, :taggings
  end
end
