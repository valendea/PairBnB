class Listing < ApplicationRecord
  belongs_to :user

  serialize :photos, Array
  mount_uploaders :photos, PhotoUploader

  paginates_per 10

end
