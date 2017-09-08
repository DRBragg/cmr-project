class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :reviews
  has_many :comments
  has_many :representatives
  has_many :upvotes
  has_many :downvotes
  has_many :reviews, :through => :upvotes
  has_many :reviews, :through => :downvotes
end
