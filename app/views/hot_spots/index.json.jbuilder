json.array!(@hot_spots) do |hot_spot|
  json.extract! hot_spot, :id, :name
  json.url hot_spot_url(hot_spot, format: :json)
end
