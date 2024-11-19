class Message < ApplicationRecord
  belongs_to :user
  belongs_to :reservations

  after_create_commit :broadcast_message

  private

  def broadcast_message
    broadcast_append_to "reservation_#{reservation.id}_messages",
                        partial: "messages/message",
                        locals: { message: self, user: user }
  end
end
