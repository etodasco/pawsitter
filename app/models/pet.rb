class Pet < ApplicationRecord
  belongs_to :users
  has_many :reservations
end
