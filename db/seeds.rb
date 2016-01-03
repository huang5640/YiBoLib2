# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.destroy_all
User.destroy_all
Location.destroy_all

Location.create!([
	{name: "益博总馆", address: "1111 yibo rb, zhenxiong", phone: "888888888", manager: 1, open_at: "9:00", close_at: "17:00"},
   {name: "泥巴馆", address: "10101 niba rb, zhenxiong", phone: "77777777", manager: 2, open_at: "9:00", close_at: "20:00"}
])

User.create!([
	{ YiBoID: "11111111", name: "Jax", GovID: "401213789123", address: "1075 Space Park Way, Mountain View, CA", AuthNum: 3, password_digest: User.digest("huangjiajun")},
	{ YiBoID: "22222222", name: "Baby", GovID: "412378124891", address: "973 Dolors Ave, Los Altos, CA", AuthNum: 2, password_digest: User.digest("yubingting")},
	{ YiBoID: "33333333", name: "Vincent", GovID: "1238973928111", address: "white house, WA", AuthNum: 5, password_digest: User.digest("hahahaha")}])

10.times do |n|
  name = Faker::Name.name
  yiboid = Faker::Number.number(8)
  govid = Faker::Number.number(11)
  add = Faker::Address.street_address
  authnum = Faker::Number.number(1)
  pw = 'password'

  User.create!(name: name, YiBoID: yiboid, GovID: govid, address: add, AuthNum: authnum, password_digest: User.digest(pw))

end

p "Created #{User.count} users"

isbn_array = [9787509776704, 9787544757225, 9787549567027, 9787550260474, 9787511356949, 9787550257610, 9787549568833, 9787229097042, 9787540775704, 9787508653488, 9787307162525, 9787544277082]
isbn_array.each do |isbn|
book = Book.search_douban_by_isbn(isbn).save
end
Book.create!([{title: Book.first["title"], author: Book.first["author"], description: Book.first["description"], ISBN: Book.first["ISBN"], image: Book.first["image"], location: Location.first }])
Book.create!([{title: Book.first["title"], author: Book.first["author"], description: Book.first["description"], ISBN: Book.first["ISBN"], image: Book.first["image"], location: Location.second }])
p "Created #{Book.count} books"

Manager.create!([
  { user: User.first},
  { user: User.second},
  { user: User.third}])

p "Created #{Manager.count} managers"
