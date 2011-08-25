class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :slug
      t.string :title
      t.text :tagline
      t.belongs_to :owner

      t.timestamps
    end
    add_index :sites, :owner_id
    add_index :sites, :slug
  end
end
