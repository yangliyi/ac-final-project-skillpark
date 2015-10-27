json.array!(@admin_skills) do |admin_skill|
  json.extract! admin_skill, :id
  json.url admin_skill_url(admin_skill, format: :json)
end
