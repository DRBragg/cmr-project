class Representative < ApplicationRecord
  has_many :reviews
  belongs_to :user

  def before_validation_on_create
      self.phone_number = phone_number.gsub(/[^0-9]/, "")
   end

   validates_presence_of :phone_number
   validates_length_of :phone_number, :is=>10

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :office, presence: true
  validates :bio, presence: true, length: { minimum: 10, maximum: 255 }
  validates :elected, presence: true
  validates :picture_url, presence: true
  validates :office, presence: true
  validates :user_id, presence: true

  def name
    self.first_name + ' '+ self.last_name
  end
end
