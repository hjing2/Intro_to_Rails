# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'net/http'
require 'json'

Address.destroy_all
School.destroy_all
Park.destroy_all

address_url = 'https://data.winnipeg.ca/resource/cam2-ii3u.json'
school_url = 'https://data.winnipeg.ca/resource/5298-dhjx.json'
park_url = 'https://data.winnipeg.ca/resource/tx3d-pfxq.json'

def fetch_data(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

addresses = fetch_data(address_url)
schools = fetch_data(school_url)
parks = fetch_data(park_url)

addresses.each do |a|
  Address.create!(
    street_number: a['street_number'],
    street_name: a['street_name'],
    street_type: a['street_type'],
    neighbourhood: a['neighbourhood'],
    ward: a['ward'],
    school_division: a['school_division'],
    school_division_ward: a['school_division_ward'],
    latitude: a['location']['latitude'],
    longitude: a['location']['longitude'],
    full_address: a['full_address'],
    street_address: a['street_address']
  )
end

schools.each do |s|
  School.create!(
    school: s['school'],
    street_name: s['street_name'],
    language: s['language'],
    year_installed: s['year_installed'],
    legislation_link: s['legislation_link'],
    location: s['location']
  )
end

parks.each do |p|
  address = Address.find_by(neighbourhood: p['neighbourhood'])
  if address
    Park.create!(
      park_name: p['park_name'],
      address: address.full_address,
      location_description: p['location_description'],
      neighbourhood: p['neighbourhood'],
      location: p['location']
    )
  end
end

puts "Seeded #{Address.count} addresses, #{School.count} schools, and #{Park.count} parks."
