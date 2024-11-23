class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.string :status
      t.date :start_date
      t.date :end_date
      t.references :pet_owner, foreign_key: { to_table: :users }, null: false
      t.references :pet_sitter, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
