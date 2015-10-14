# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  locations = Location.create([{ city: '基隆市' }, { city: '台北市' }, { city: '新北市'}, { city: '桃園市' }, { city: '新竹市' }, { city: '新竹縣' }, { city: '苗栗縣' }, { city: '台中市' }, { city: '南投縣市' }, { city: '彰化縣市' }, { city: '雲林縣市' }, { city: '嘉義市' }, { city: '嘉義縣' }, { city: '台南市' }, { city: '高雄市' }, { city: '屏東縣市' }, { city: '台東縣市' }, { city: '花蓮縣市' }, { city: '宜蘭縣市' }, { city: '澎湖縣' }, { city: '金門縣' }, { city: '連江縣' }])
  categories = Category.create([{name: '運動'}, {name: '藝術'}, {name: '程式設計'}, {name: '語言'}, {name: '商業'}, {name: '其他'}])