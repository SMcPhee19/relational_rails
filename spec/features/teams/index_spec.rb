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

  # User Story 11
  describe 'create new' do
    it 'shows a link to create a new parent' do
      visit '/teams'
      expect(page).to have_content("New Team")
    end

    it 'the link takes you to the expected page' do
      visit '/teams'
      click_on "New Team"

      expect(current_path).to eq("/teams/new")
    end

    it 'has a form to create a new parent' do
      visit "/teams/new"

      expect(page).to have_content("Enter a new team")
      expect(page).to have_content("City")
      expect(page).to have_content("Team Name")
      expect(page).to have_content("Stanley Cup Champion")
      expect(page).to have_content("Points")
      expect(page).to have_content("Division")
    end

    it 'created a new parent' do
      visit "/teams"
      expect(page).to_not have_content("Coyotes")

      visit "/teams/new"
      fill_in("City", with: "Tempe")
      fill_in("Team Name", with: "Coyotes")
      fill_in("Stanley Cup Champion", with: false)
      fill_in("Points", with: 57)
      fill_in("Division", with: "Central")

      click_button("Create Team")
      expect(current_path).to eq("/teams")

      visit "/teams"
      expect(page).to have_content("Coyotes")
    end
  end
end
