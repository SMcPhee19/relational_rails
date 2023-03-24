#spec/features/teams/index_spec.rb
require 'rails_helper'

RSpec.describe "/teams", type: :feature do
  let!(:colorado_avalanche) {Team.create!(city: "Denver",
    team_name: "Avalanche",
    stanley_cup_champ: true,
    points: 119,
    division: "Central" )}

  let!(:seattle_kraken) {Team.create!(city: "Seattle",
    team_name: "Kraken",
    stanley_cup_champ: false,
    points: 60,
    division: "Pacific" )}
  
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
    
  # User Story 1
  describe "as a visitor, when I visit the team index page" do
    it "displays the name of each team" do
      visit "/teams"
      
      expect(page).to have_content("Team Index Page")
      expect(page).to have_content(colorado_avalanche.team_name)
      expect(page).to have_content(seattle_kraken.team_name)
    end
  end
end

