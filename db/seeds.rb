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

#Creating Cinemas for each multiplex
Multiplex.all.each do |multiplex|
  rand(7..15).times do
    name = Faker::Artist.name
    Cinema.create(name: "Cinema #{name}", multiplex_id: multiplex.id)
  end
end

#Creating movies
30.times do
  name = Faker::Movie.title
  director = Faker::Name.name
  year = Faker::Date.between(from: '1950-09-23', to: '2019-09-25')
  Movie.create(name: name, year: year, director: director)
end

#Creating cinema places
Cinema.all.each do |cinema|
  40.times do
    movie = Movie.all.sample.id
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


