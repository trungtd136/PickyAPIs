json.array!(@dining_offers) do |dining_offer|
  json.extract! dining_offer, :title, :description, :image_url, :web_url, restaurant_id
  json.url dining_offer_url(dining_offer, format: :json)
end