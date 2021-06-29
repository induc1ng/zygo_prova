# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |j|
    Book.create(title:Faker::Lorem.sentences(number:1),author: Faker::Book.title,image:j.to_s+".jpg",description:Faker::Lorem.paragraph(sentence_count: 5))
end

user = User.create! :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', admin => 1