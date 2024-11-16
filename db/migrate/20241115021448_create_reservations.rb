class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.string :status
      t.date :start_date
      t.date :end_date
      t.integer :pet_owner_id
      t.integer :pet_sitter_id

      t.timestamps
    end
  end
end
