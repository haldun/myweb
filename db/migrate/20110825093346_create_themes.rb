class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.belongs_to :site
      t.string :name
      t.text :description
      t.string :directory
      t.datetime :published_at

      t.timestamps
    end
    add_index :themes, :site_id
  end
end
