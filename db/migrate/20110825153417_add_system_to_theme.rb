class AddSystemToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :system, :boolean, :default => false
    add_index :themes, :system
  end
end
