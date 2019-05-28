class Garden < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :price, presence: true, numericality: true
  validates :square_meters, presence: true, numericality: true
  validates :description, presence: true
  validates :address, presence: true
  validates :title, presence: true, uniqueness: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
end
