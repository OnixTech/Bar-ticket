# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
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
end

if User.count < 1
  master = User.new(
    :email => "a@mail.com",
    :password => "a@mail.com",
    :active => true,
    :role_id => 1
  )
  master.save!

  pfe = User.new(
    :email => "info@schankhalle-pfefferberg.de",
    :password => "123456",
    :active => true,
    :role_id => 2
  )
  pfe.save!
  
  manager = User.new(
    :email => "b@mail.com",
    :password => "b@mail.com",
    :role_id => 2
  )
  manager.save!
end

if Company.count < 1
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
end