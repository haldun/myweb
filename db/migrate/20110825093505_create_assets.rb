class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.belongs_to :site
      t.belongs_to :theme
      t.string :name
      t.string :type
      t.text :content
      t.string :path

      t.timestamps
    end
    add_index :assets, :site_id
    add_index :assets, :theme_id
    add_index :assets, :name
    add_index :assets, :type
  end
end
