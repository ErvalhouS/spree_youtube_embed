class CreateSpreeVideo < ActiveRecord::Migration

  def self.up
    create_table :spree_videos do |t|
      t.integer :variant_id
      t.integer :position
      t.string :attachment
      t.string :alt
      t.timestamps
    end
    add_index :spree_videos, :variant_id
    add_index :spree_videos, :position
  end

  def self.down
    drop_table :spree_videos
  end
end
