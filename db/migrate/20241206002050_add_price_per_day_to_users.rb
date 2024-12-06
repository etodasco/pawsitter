class AddPricePerDayToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :price_per_day, :integer
  end
end
