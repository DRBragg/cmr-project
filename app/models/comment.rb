class Comment < ApplicationRecord
  belongs_to :review
  validates :body, presence: true
  validates :review_id, presence: true
end
