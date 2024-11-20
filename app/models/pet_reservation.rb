class PetReservation < ApplicationRecord
  belongs_to :reservation
  belongs_to :pet
end
