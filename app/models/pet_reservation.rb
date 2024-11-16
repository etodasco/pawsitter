class PetReservation < ApplicationRecord
  belongs_to :reservations
  belongs_to :pets
end
