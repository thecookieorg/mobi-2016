json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :address, :phone, :website, :latitude, :longitude, :hot_spot_id
  json.url listing_url(listing, format: :json)
end
