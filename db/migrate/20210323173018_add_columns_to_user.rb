class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fullname, :string
    add_column :users, :username, :string
  end
end
