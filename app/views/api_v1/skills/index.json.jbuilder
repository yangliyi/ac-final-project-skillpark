json.metadata do
  json.total Skill.count
end

json.data @skills do |s|
  json.id s.id
  json.name s.name
  json.requirement s.requirement
  json.description s.description
  json.username s.user.profile.username
  if s.user.profile.location
    json.location s.user.profile.location.city
  else
    json.location ""
  end
  json.category s.categories.map{|c| [c.id, c.name, asset_url(c.category_icon.url)]}
  json.pictures s.pictures do |p|
    json.url asset_url( p.image.url )
  end
  json.liked_users_count s.liked_users_count
end