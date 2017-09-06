class Representative < ApplicationRecord
  has_many :reviews
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :office, presence: true
  validates :bio, presence: true
  validates :elected, presence: true
  validates :phone_number, presence: true
  validates :picture_url, presence: true
  validates :office, presence: true
  validates :user_id, presence: true


end
