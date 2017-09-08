class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user, uniqueness: { scope: :review}
  validates :review, uniqueness: { scope: :user}
end
