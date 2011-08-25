class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :display_name

      t.timestamps
    end
    add_index :users, :email
  end
end
