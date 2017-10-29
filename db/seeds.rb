# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed Users

user = {}
user['password'] = 'asdf'
# user['password_confirmation'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['photo'] = Faker::Avatar.image

    # user['gender'] = rand(1..2)
    # user['phone'] = Faker::PhoneNumber.phone_number
    # user['country'] = Faker::Address.country
    # user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = Faker::App.name
    # listing['place_type'] = rand(1..3)
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

    listing['num_of_rooms'] = rand(1..5)
    listing['no_of_bathrooms'] = rand(1..2)
    # listing['guest_number'] = rand(1..10)

    # listing['country'] = Faker::Address.country
    # listing['state'] = Faker::Address.state
    # listing['city'] = Faker::Address.city
    # listing['zipcode'] = Faker::Address.zip_code
    # listing['address'] = Faker::Address.full_address
    listing['address'] = ["123 6th St. Melbourne, FL 32904", "71 Pilgrim Avenue Chevy Chase, MD 20815", "70 Bowman St. South Windsor, CT 06074", "4 Goldfield Rd. Honolulu, HI 96815", "44 Shirley Ave. West Chicago, IL 60185", "514 S. Magnolia St. Orlando, FL 32806", "488 Purple Finch St. Roanoke Rapids, NC 27870", "523 Miller St. Sunnyside, NY 11104", "258 Bradford Ave. Wilson, NC 27893"].sample

    listing['price'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence
    listing['house_rules'] = ["Not suitable for pets", "No parties or events", "Check in time is flexible", "Check out by 10AM", "Parties are strictely prohibited", "No noise after 11pm"].sample

    listing['user_id'] = uids.sample
    # byebug
    Listing.create(listing)
  end
end