class CreatePetReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :pet_reservations do |t|
      t.references :reservations, null: false, foreign_key: true
      t.references :pets, null: false, foreign_key: true

      t.timestamps
    end
  end
end
