class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user

  validates :body, presence: true, length: { minimum: 10, maximum: 255 }
  validates :review_id, presence: true
  validates :user_id, presence: true
end
