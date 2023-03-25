#spec/features/teams/index_spec.rb
require 'rails_helper'

RSpec.describe "/teams", type: :feature do
  let!(:colorado_avalanche) {Team.create!(city: "Denver",
    team_name: "Avalanche",
    stanley_cup_champ: true,
    points: 119,
    division: "Central",
    created_at: 2.days.ago)}

  let!(:seattle_kraken) {Team.create!(city: "Seattle",
    team_name: "Kraken",
    stanley_cup_champ: false,
    points: 60,
    division: "Pacific",
    created_at: 1.days.ago)}
  
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
  # User Story 6
  describe "as a visitor when I visit the team index" do
    it 'displays teams based on what was created most recently' do
      visit "/teams"
      # save_and_open_page
      expect(seattle_kraken.team_name).to appear_before(colorado_avalanche.team_name)
    end
  end

  # User Story 9
  describe "as a visitor on any page, I see a link to the parent" do
    it 'when the team link is clicked it takes you to the team index page' do
      visit "/teams"
      click_on "Teams"

      expect(current_path).to eq("/teams")

      visit "/players"
      click_on "Teams"

      expect(current_path).to eq("/teams")

      visit "/players/#{gabe.id}"
      click_on "Teams"

      expect(current_path).to eq("/teams")

      visit "/teams/#{colorado_avalanche.id}"
      click_on "Teams"

      expect(current_path).to eq("/teams")
    end
  end
end

