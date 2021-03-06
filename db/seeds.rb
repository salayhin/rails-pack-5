# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'cities.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  city = UsaCity.new
  city.name = row['city']
  city.zip_code = row['zip']
  city.state = row['state']
  city.latitude = row['lat']
  city.longitude = row['lng']
  city.save

  puts "#{city.state}, #{city.name} saved"
end
