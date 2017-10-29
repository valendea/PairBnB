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
end
