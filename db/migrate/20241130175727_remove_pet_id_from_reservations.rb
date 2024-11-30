class RemovePetIdFromReservations < ActiveRecord::Migration[7.2]
  def change
    remove_column :reservations, :pet_id
  end
end
