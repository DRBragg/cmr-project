class Review < ApplicationRecord
  belongs_to :representative

  validates :headline, presence: true
  validates :body, presence: true
  validates :rating, numericality: true, presence: true
end
