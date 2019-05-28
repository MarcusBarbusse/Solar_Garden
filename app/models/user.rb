class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :gardens
  has_many :gardens, through: :bookings

  validates :adress, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
end
