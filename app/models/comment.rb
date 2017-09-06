class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user
  validates :body, presence: true
  validates :review_id, presence: true
  validates :user_id, presence: true
end
