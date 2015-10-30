json.metadata do
  json.total Category.count
end

json.data @categories do |c|
  json.id c.id
  json.name c.name
  json.category_icon asset_url(c.category_icon.url)
end