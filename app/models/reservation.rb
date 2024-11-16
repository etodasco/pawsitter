class Reservation < ApplicationRecord
  belongs_to :pet_reservations
  belongs_to :reviews
  belongs_to :messages
end
