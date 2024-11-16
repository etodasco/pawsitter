class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pet_sitters_users, foreign_key: :pet_sitter_id, class_name: 'Reservation'
  has_many :pet_sitters, through: :pet_sitters_users
  has_many :pet_owners_users, foreign_key: :pet_owner_id, class_name: 'Reservation'
  has_many :pet_owners, through: :pet_owners_users
end
