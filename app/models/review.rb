class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reservation, optional: true
  belongs_to :reviewer, class_name: 'User'

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :content, presence: true

end
