json.metadata do
  json.total Profile.count
end

json.data @profiles do |p|
  json.id p.id
  json.username p.username
  if p.description
    json.description p.description
  else
    json.description ""
  end
  json.photo asset_url(p.photo.url)
  if p.location
    json.location p.location.city
  else
    json.location ""
  end
  if p.categories
    json.category p.categories.map{|c| [c.id, c.name, asset_url(c.category_icon.url)] }
  else
    json.category ""
  end
  json.public_comment p.publiccomments.map {|p| [p.user.profile.username, p.content] }
  json.favorited_users_count p.favorited_users_count
  if p.user.favorite_profiles
    json.favorites p.user.favorite_profiles.map{|p| [p.id, p.username] }
  else
    json.favorites ""
  end
end