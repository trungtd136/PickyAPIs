json.array!(@photos) do |photo|
  json.extract! photo, :title, :description, :img_thumb_url, :img_url, :profile_id, :restaurant_id
  json.url photo_url(photo, format: :json)
end