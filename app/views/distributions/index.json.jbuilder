json.array!(@distributions) do |distribution|
  json.extract! distribution, :id, :name, :city_id
  json.url distribution_url(distribution, format: :json)
end
