# spec/features/players/show_spec.rb
require 'rails_helper'

RSpec.describe "/players/:id" do
  describe 'as a visitor, when I visit the players show page' do
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

    it 'shows player data' do
      # User Story 4
      visit "/players/#{gabe.id}"
      
      expect(page).to have_content("Player Show Page")
      expect(page).to have_content(gabe.name)
      expect(page).to have_content(gabe.birthplace)
      expect(page).to have_content(gabe.league_award_winner)
      expect(page).to have_content(gabe.jersey_number)
      expect(page).to have_content(gabe.position)
      expect(page).to_not have_content(bo.name)
    end
  end
end