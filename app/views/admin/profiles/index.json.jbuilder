json.array!(@admin_profiles) do |admin_profile|
  json.extract! admin_profile, :id
  json.url admin_profile_url(admin_profile, format: :json)
end
