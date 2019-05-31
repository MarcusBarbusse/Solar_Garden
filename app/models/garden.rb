class Garden < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :bookings
  belongs_to :user

  validates :price, presence: true, numericality: true
  validates :square_meters, presence: true, numericality: true
  validates :description, presence: true
  validates :address, presence: true
  validates :title, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_address_and_square_meters,
    against: [ :address, :square_meters ],
    using: {
      tsearch: { prefix: true }
    }

end
