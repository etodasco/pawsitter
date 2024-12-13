class AddAvailabilityToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :availability_start, :date
    add_column :users, :availability_end, :date
  end
end
