class RemovePriceFromTicket < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :price
  end
end
