# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'a@gmail.com')
User.create(email: 'b@gmail.com')

ShortenedUrl.create(long_url: 'http://espn.go.com', short_url: 'https://randomcode.su', submitter_id: 1)

