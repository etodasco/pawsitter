class AddPriceToReservations < ActiveRecord::Migration[7.2]
  def change
    add_column :reservations, :price, :integer
  end
end