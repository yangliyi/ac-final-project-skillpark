json.metadata do
  json.total Profile.count
end

json.data @profiles do |p|
  json.id p.id
  json.username p.username
  json.description p.description
  json.photo asset_url(p.photo.url)
  if p.location
    json.location p.location.city
  end
  json.category p.categories.map{|c| [c.id, c.name, asset_url(c.category_icon.url)] }
  json.public_comment p.publiccomments.map {|p| [p.user.profile.username, p.content] }
  json.favorited_users_count p.favorited_users_count
end