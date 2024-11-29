class AddPetIdToReservations < ActiveRecord::Migration[7.2]
  def change
    add_column :reservations, :pet_id, :integer
  end
end
