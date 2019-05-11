class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.belongs_to :tag, foreign_key: true
      t.belongs_to :micropost, foreign_key: true

      t.timestamps
    end
    add_index :taggings, [:tag_id, :micropost_id], unique: true
  end
end
