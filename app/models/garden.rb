class Garden < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :bookings
  belongs_to :user

  validates :price, presence: true, numericality: true
  validates :square_meters, presence: true, numericality: true
  validates :description, presence: true
  validates :address, presence: true
  validates :title, presence: true
  #   def gardens
  #     @gardens ||= find_gardens
  #   end

  #   private

  #   def find_gardens
  #     Garden.find(:all, :conditions => conditions)
  #   end

  #   def keyword_conditions
  #     ["garden.city LIKE ?", "%#{keywords}"] unless keywords.blank?
  #   end

  #   def minimum_size_conditions
  #     ["gardens.square_meters >= ?", minimum_size] unless minimum_size.blank?
  #   end

  # def maximum_size_conditions
  #   ["gardens.square_meters <= ?", maximum_size] unless maximum_size.blank?
  # end

  # def conditions
  #   [conditions_clauses.join(' AND '), *conditions_options]
  # end

  # def conditions_clauses
  #   conditions_parts.map { |condition| condition.first }
  # end

  # def conditions_options
  #   conditions_parts.map { |condition| condition[1..-1] }.flatten
  # end

  # def conditions_parts
  #   private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  # end
end
