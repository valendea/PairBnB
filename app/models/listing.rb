class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, presence: true
  validates :property_type, presence: true
  validates :num_of_rooms, presence: true
  validates :no_of_bathrooms, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :house_rules, presence: true

  geocoded_by :address
  after_validation :geocode

  serialize :photos, Array
  mount_uploaders :photos, PhotoUploader

  paginates_per 10

  scope :search_with_country, -> (country) { where("country like ?", "#{country}%")}

  def self.search(search)
    result = []
    result << where("title LIKE ?", "%#{search}%")
    result << where("property_type LIKE ?", "%#{search}%") 
    result << where("description LIKE ?", "%#{search}%") 
    result << where("address LIKE ?", "%#{search}%")
    
    i = 0
    while i < 4
      return result[i] if result[i].length > 0 
      i += 1
    end
  end
end
