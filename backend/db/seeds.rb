# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Geolocation.create!(
  ip: '192.168.1.1',
  host: 'example.com',
  type: 'ipv4',
  continent_code: 'NA',
  continent_name: 'North America',
  country_code: 'US',
  country_name: 'United States',
  region_code: 'CA',
  region_name: 'California',
  city: 'Los Angeles',
  zip: '90001',
  latitude: 34.0522,
  longitude: -118.2437
)
