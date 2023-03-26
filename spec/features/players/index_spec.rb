#spec/features/players/index_spec.rb
require 'rails_helper'

RSpec.describe "/players", type: :feature do
  #User Story 3
  describe "as a visitor, when I visit the players index page" do
    let!(:colorado_avalanche) {Team.create!(city: "Denver",
      team_name: "Avalanche",
      stanley_cup_champ: true,
      points: 119,
      division: "Central" )}

    let!(:gabe) {colorado_avalanche.players.create!(name: "Gabriel Landeskog", 
      birthplace: "Stockholm, SWE",
      league_award_winner: true,
      jersey_number: 92,
      position: "Left Wing",)}

    let!(:bo) {colorado_avalanche.players.create!(name: "Bowen Byram",
      birthplace: "Cranbrook, BC, CAN",
      league_award_winner: false,
      jersey_number: 4,
      position: "Defense")}

    it "I see the attributes of each player" do 
      visit "/players"
      
      expect(page).to have_content("Player Index Page")
      expect(page).to have_content("Name: #{gabe.name}")
      expect(page).to have_content("Birthplace: #{gabe.birthplace}")
      expect(page).to have_content("League Award Winner: #{gabe.league_award_winner}")
      expect(page).to have_content("Jersey Number: #{gabe.jersey_number}")
      expect(page).to have_content("Position: #{gabe.position}")

      expect(page).to have_content("Name: #{bo.name}")
      expect(page).to have_content("Birthplace: #{bo.birthplace}")
      expect(page).to have_content("League Award Winner: #{bo.league_award_winner}")
      expect(page).to have_content("Jersey Number: #{bo.jersey_number}")
      expect(page).to have_content("Position: #{bo.position}")
    end

    # User Story 8
    it "I see a link to the child index" do
      visit "/players"
      click_on "Players"

      expect(current_path).to eq("/players")

      visit "/teams"
      click_on "Players"

      expect(current_path).to eq("/players")

      visit "/players/#{gabe.id}"
      click_on "Players"

      expect(current_path).to eq("/players")

      visit "/teams/#{colorado_avalanche.id}"
      click_on "Players"

      expect(current_path).to eq("/players")
    end
  end
end




