# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "csv"

CSV.foreach('db/house_data.csv', headers: true) do |row|
  House.create(:id => row[0],
               :Firstname => row[1],
               :Lastname => row[2],
               :City => row[3],
               :num_of_people => row[4],
               :has_child => row[5])
end

CSV.foreach('db/dataset_50.csv', headers: true) do |row|
  Dataset.create(:id => row[0],
                 :Label => row[1],
                 :house_id => row[2],
                 :Year => row[3],
                 :Month => row[4],
                 :Temperature => row[5],
                 :Daylight => row[6],
                 :EnergyProduction => row[7])
end
