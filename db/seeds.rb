# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Creating roles..."

roles = [
  {
    name: "master",
    description: "App owner"
  },
  {
    name: "manager",
    description: "Manager of the bar or restaurant who is allow to make changes on the menu"
  }
]

if Role.count  < 1
  roles.each do |role|
    Role.create(role)
  end
puts "Roles Created"
end

puts "Users..."

if User.count < 1
  puts "..." 
  master = User.new(
    :email => "a@mail.com",
    :password => "a@mail.com",
    :active => true,
    :role_id => 1
  )
  master.save!
  
  pablo = User.new(
    :email => "pablo@fillo.com",
    :password => "Pablo88Fillo$",
    :active => true,
    :role_id => 1
  )
  pablo.save!

  puts "..."
  p master
  pfe = User.new(
    :email => "info@schankhalle-pfefferberg.de",
    :password => "123456",
    :active => true,
    :role_id => 2
  )
  pfe.save!
  puts "..."
  p pfe
  manager = User.new(
    :email => "b@mail.com",
    :password => "b@mail.com",
    :role_id => 2
  )
  manager.save!
  puts "..."
  p manager
  puts "Three users successfully created." 
end
  puts "Companies..."

if Company.count < 1
  company = Company.new(
    :name => "Loco Loco",
    :city => Faker::Address.city,
    :suburb => Faker::Address.community,
    :street => Faker::Address.street_name,
    :number => Faker::Address.building_number.to_i,
    :post => Faker::Address.zip_code.to_i,
    :user_id => 1
  )
  company.save!
  puts "."
  p company

  restaurant = Company.new(
    :name => "Pfefferberg",
    :city => " Berlin",
    :suburb => "Prenzlauer Berg",
    :street => "Schönhauser Allee",
    :number => "176",
    :post => "10119",
    :user_id => 2
  )
  restaurant.save!
  puts "."
  p restaurant

  company = Company.new(
    :name => Faker::Restaurant.name,
    :city => Faker::Address.city,
    :suburb => Faker::Address.community,
    :street => Faker::Address.street_name,
    :number => Faker::Address.building_number.to_i,
    :post => Faker::Address.zip_code.to_i,
    :user_id => 1
  )
  company.save!
  puts "."
  p company

  restaurant = Company.new(
    :name => Faker::Restaurant.name,
    :city => Faker::Address.city,
    :suburb => Faker::Address.community,
    :street => Faker::Address.street_name,
    :number => Faker::Address.building_number.to_i,
    :post => Faker::Address.zip_code.to_i,
    :user_id => 2
  )
  restaurant.save!
  puts "."
  p restaurant
  puts "Four companies successfully created."
end
puts "Stations..."
if Station.count < 1
  station = Station.new(
    :name => Faker::Commerce.department,
    :company_id => 1
  )
  station.save!
  puts "."
  p station
  station = Station.new(
    :name => Faker::Commerce.department,
    :company_id => 2
  )
  station.save!
  puts "."
  p station
  station = Station.new(
    :name => Faker::Commerce.department,
    :company_id => 3
  )
  station.save!
  puts "."
  p station
  station = Station.new(
    :name => Faker::Commerce.department,
    :company_id => 4
  )
  station.save!
  puts "."
  p station
  puts "Four stations successfully created."
end
  puts "Orders..."
if Order.count < 1
  order = Order.new(
    :table => Faker::Address.building_number,
    :content => Faker::ChuckNorris.fact,
    :number => 1,
    :total => '%.2f' % Faker::Number.between(from: 0.05, to: 100),
    :station_id => 1
  )
  order.save!
  puts "."
  p order
  order = Order.new(
    :table => Faker::Address.building_number,
    :content => Faker::ChuckNorris.fact,
    :total => '%.2f' % Faker::Number.between(from: 0.05, to: 100),
    :number => 1,
    :station_id => 2
  )
  order.save!
  puts "."
  p order
  order = Order.new(
    :table => Faker::Address.building_number,
    :content => Faker::ChuckNorris.fact,
    :total => '%.2f' % Faker::Number.between(from: 0.05, to: 100),
    :number => 1,
    :station_id => 3
  )
  order.save!
  puts "."
  p order
  order = Order.new(
    :table => Faker::Address.building_number,
    :content => Faker::ChuckNorris.fact,
    :total => '%.2f' % Faker::Number.between(from: 0.05, to: 100),
    :number => 1,
    :station_id => 4
  )
  order.save!
  puts "."
  p order
  puts "Four orders successfully created."
end