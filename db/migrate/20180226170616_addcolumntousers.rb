class Addcolumntousers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :batch_wagon,:string
  end
end
