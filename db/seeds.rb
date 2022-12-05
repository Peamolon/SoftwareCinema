# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
#

#Creating Multiplex
10.times do
  name = Faker::Coffee.blend_name
  address = Faker::Address.street_address
  Multiplex.create(name: name, address: address)
end

#Creating movies
30.times do
  name = Faker::Movie.title
  director = Faker::Name.name
  year = Faker::Date.between(from: '1950-09-23', to: '2019-09-25')
  Movie.create(name: name, year: year, director: director)
end

#Creating Cinemas for each multiplex
Multiplex.all.each do |multiplex|
  rand(7..15).times do
    name = Faker::Artist.name
    movie = Movie.all.sample.id
    Cinema.create!(name: "Cinema #{name}", multiplex_id: multiplex.id, movie_id: movie)
  end
end

#Creating cinema places
Cinema.all.each do |cinema|
  40.times do
    CinemaPlace.create(cinema_id: cinema.id, cinema_place_type: :general, price: '11000')
  end

  20.times do
    CinemaPlace.create(cinema_id: cinema.id, cinema_place_type: :preference, price: '15000')
  end
end

#Creating products
products = ['Hot dog', 'Sandwich', 'Nachos', 'Pop Corn', 'Chocolate', 'Soda']

products.each do |product|
  Product.create(name: product, price: rand(8000..20000))
end

#Create multiple Califications

200.times do
  rate = rand(1..5)
  comment = Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4)
  movie_id = Movie.all.sample.id
  date = Faker::Time.between(from: 2.years.ago, to: Time.now).to_date
  Calification.create(rate: rate, date: date, movie_id: movie_id, comment: comment)
end

#create users

100.times do
  name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  telephone = Faker::PhoneNumber.phone_number
  address = Faker::Address.street_address
  id_number = Faker::IDNumber.valid
  email = "#{name}@prueba.com"
  password = "123456"
  role = "Client"
  user = User.create(name: name, last_name:last_name, telephone: telephone, address: address, id_number: id_number, email: email, role: role, password: password)
  Client.create(user_id: user.id)
end

300.times do
  count = rand(1..20) * 5
  client_id = Client.all.sample.id
  product_order_id = ProductOrder.first.id
  Point.create(count: count, client_id: client_id, product_order_id: product_order_id)
end


