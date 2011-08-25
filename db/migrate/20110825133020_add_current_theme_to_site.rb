class AddCurrentThemeToSite < ActiveRecord::Migration
  def change
    add_column :sites, :current_theme_id, :belongs_to
    add_index :sites, :current_theme_id
  end
end
