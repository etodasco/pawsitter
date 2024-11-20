class Reservation < ApplicationRecord
  belongs_to :pet_sitter, class_name: 'User', foreign_key: :pet_sitter_id
  belongs_to :pet_owner, class_name: 'User', foreign_key: :pet_owner_id
  has_many :messages
  has_many :pet_reservations
  has_many :pets, through: :pet_reservations
end
