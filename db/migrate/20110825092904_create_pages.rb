class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.belongs_to :site
      t.string :title
      t.string :slug
      t.belongs_to :author
      t.text :content

      t.timestamps
    end
    add_index :pages, :site_id
    add_index :pages, :author_id
    add_index :pages, :slug
  end
end
