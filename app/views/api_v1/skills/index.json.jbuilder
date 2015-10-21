json.metadata do
  json.total Skill.count
end

json.data @skills do |s|
  json.id s.id
  json.name s.name
  json.requirement s.requirement
  json.description s.description
  json.category s.categories.map{|c|c.id}
end