class Pet < ApplicationRecord
  belongs_to :user
  has_many :pet_reservations
  has_many :reservations, through: :pet_reservations
end
