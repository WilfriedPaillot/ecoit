class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_index :users, :nickname, unique: true
    add_column :users, :role, :integer, default: 0
  end
end
