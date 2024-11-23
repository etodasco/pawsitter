class AddPetSitterToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :pet_sitter, :boolean, default: false
  end
end