json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name, :cuisine, :address, :contact, :web_url, :raiting
  json.url restaurant_url(restaurant, format: :json)
end