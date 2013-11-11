json.array!(@reviews) do |review|
  json.extract! review, :content, :profile_id, :restaurant_id
  json.url review_url(review, format: :json)
end