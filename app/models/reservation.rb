class Reservation < ApplicationRecord
  belongs_to :pet_sitter, class_name: 'User', foreign_key: :pet_sitter_id
  belongs_to :pet_owner, class_name: 'User', foreign_key: :pet_owner_id
  has_many :messages, dependent: :destroy
  has_many :pet_reservations, dependent: :destroy
  has_many :pets, through: :pet_reservations
  after_update_commit :broadcast_message

  private

  def broadcast_message
    broadcast_replace_to "user_#{self.pet_owner_id}_reservations",
                        partial: "reservations/sent_reservation",
                        locals: { reservation:self },
                        target: "reservation_#{self.id}"
  end

end
