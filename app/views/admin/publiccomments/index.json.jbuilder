json.array!(@admin_publiccomments) do |admin_publiccomment|
  json.extract! admin_publiccomment, :id
  json.url admin_publiccomment_url(admin_publiccomment, format: :json)
end
