json.array!(@profiles) do |profile|
  json.extract! profile, :name, :email, :profile_icon
  json.url profile_url(profile, format: :json)
end