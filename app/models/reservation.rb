class Reservation < ApplicationRecord
  belongs_to :pet_sitter, class_name: 'User'
  belongs_to :pet_owner, class_name: 'User'

end
