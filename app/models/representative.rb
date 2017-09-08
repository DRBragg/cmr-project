class Representative < ApplicationRecord
  has_many :reviews
  belongs_to :user



   validates :phone_number, presence: true, format:
    { with: /\A[\w]{3}-[\w]{3}-[\w]{4}\z/ }


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :office, presence: true
  validates :bio, presence: true, length: { minimum: 10, maximum: 255 }
  validates :elected, presence: true
  validates :picture_url, presence: true
  validates :office, presence: true
  validates :user_id, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_nil: true

  def name
    self.first_name + ' '+ self.last_name
  end

  def self.search(search)
    where("first_name LIKE ? OR last_name LIKE ? OR office LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
  end

end
