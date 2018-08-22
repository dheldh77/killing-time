# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "lsh", email: "a@a.a", password: "123456", password_confirmation: "123456")
User.create(username: "kms", email: "b@b.b", password: "123456", password_confirmation: "123456")
User.create(username: "lji", email: "c@c.c", password: "123456", password_confirmation: "123456")