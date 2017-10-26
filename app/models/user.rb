class User < ApplicationRecord
  include Clearance::User

  has_many :authentications, dependent: :destroy
  has_many :listings, dependent: :destroy

  serialize :photo
  mount_uploader :photo, PhotoUploader

  enum role: [ :customer, :moderator, :superadmin ]

    def self.create_with_auth_and_hash(authentication, auth_hash)
      # byebug
      user = self.create!(
        first_name: auth_hash["extra"]["raw_info"]["first_name"],
        last_name: auth_hash["extra"]["raw_info"]["last_name"],
        email: auth_hash["extra"]["raw_info"]["email"],
        password: SecureRandom.hex(10)
      )
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end
end
