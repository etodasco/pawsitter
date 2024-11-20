class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets 
  has_many :messages
  
  has_many :sent_reservations, class_name: "Reservation", foreign_key: :pet_owner_id
  has_many :received_reservations, class_name: "Reservation", foreign_key: :pet_sitter_id
end
