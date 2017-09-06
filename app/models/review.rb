class Review < ApplicationRecord
  belongs_to :representative
  has_many :comments
  
  validates :headline, presence: true
  validates :body, presence: true
  validates :rating, numericality: true, presence: true
  validates :representative_id, presence: true
end
