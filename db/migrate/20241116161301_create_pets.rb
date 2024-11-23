class CreatePets < ActiveRecord::Migration[7.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.text :description
      t.string :checklist
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
