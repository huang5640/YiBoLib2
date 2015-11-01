# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.destroy_all
User.destroy_all

User.create!([
	{ YiBoID: "11111111", name: "Jax", GovID: "401213789123", address: "1075 Space Park Way, Mountain View, CA", AuthNum: 3},
	{ YiBoID: "22222222", name: "Baby", GovID: "412378124891", address: "973 Dolors Ave, Los Altos, CA", AuthNum: 2},
	{ YiBoID: "33333333", name: "Vincent", GovID: "1238973928111", address: "white house, WA", AuthNum: 5}])

p "Created #{User.count} users"

Book.create!([
	{ title: "The Beauty", author: "Jason", description: "This is the first book.", ISBN: "1879238732211", image: "www.google.com"},
	{ title: "The Good", author: "Jim", description: "This is the second book.", ISBN: "9113912739821", image: "www.baidu.com"},
	{ title: "The Ugly", author: "Henry", description: "This the third book.", ISBN: "4671239812123", image: "www.yahoo.com"}])
p "Created #{Book.count} books"