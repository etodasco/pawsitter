class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :price_per_day, presence: true, if: :pet_sitter

  has_many :pets, dependent: :destroy
  has_many :messages
  has_one_attached :image
  has_many :reviews


  has_many :sent_reservations, class_name: "Reservation", foreign_key: :pet_owner_id
  has_many :received_reservations, class_name: "Reservation", foreign_key: :pet_sitter_id

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
