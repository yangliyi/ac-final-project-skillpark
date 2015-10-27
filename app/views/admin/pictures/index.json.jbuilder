json.array!(@admin_pictures) do |admin_picture|
  json.extract! admin_picture, :id
  json.url admin_picture_url(admin_picture, format: :json)
end
