class Review < ApplicationRecord
  belongs_to :representative
  belongs_to :user
  has_many :comments
  has_many :upvotes
  has_many :downvotes
  has_many :users, :through => :upvotes
  has_many :users, :through => :downvotes

  validates :headline, presence: true
  validates :body, presence: true, length: { minimum: 10, maximum: 255 }
  validates :rating, numericality: true, presence: true, inclusion: { in: 1..5}
  validates :representative_id, presence: true
  validates :user_id, presence: true



  def votes
    self.upvotes.length - self.downvotes.length
  end
end
