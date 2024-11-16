class Message < ApplicationRecord
  belongs_to :user
  belongs_to :reservations
end
