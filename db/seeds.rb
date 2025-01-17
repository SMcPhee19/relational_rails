# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.destroy_all
Team.destroy_all
@colorado_avalanche = Team.create!(city: "Denver", team_name: "Avalanche", stanley_cup_champ: true, points: 119, division: "Central" )
@seattle_kraken = Team.create!(city: "Seattle", team_name: "Kraken", stanley_cup_champ: false, points: 60, division: "Pacific" )
@colorado_avalanche.players.create!(name: "Gabriel Landeskog", birthplace: "Stockholm, SWE", league_award_winner: true, jersey_number: 92, position: "Left Wing",)
@colorado_avalanche.players.create!(name: "Bowen Byram", birthplace: "Cranbrook, BC, CAN", league_award_winner: false, jersey_number: 4, position: "Defense")
