json.extract! listing, :id, :user_id, :title, :property_type, :num_of_rooms, :created_at, :updated_at
json.url listing_url(listing, format: :json)
