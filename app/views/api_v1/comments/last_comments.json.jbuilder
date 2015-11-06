json.data @comments do |c|
  json.id c.id
  json.content c.content
  json.commentor c.user.profile.username
  json.commented_user c.profile.username
end