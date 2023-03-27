# spec/features/teams/players/index_spec.rb
require 'rails_helper'

RSpec.describe '/teams/:team_id/players' do
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

  # User Story 5
  describe 'when I visit the parents/:parent_id/child talbe' do
    it 'show each child associated with that parent' do
      visit "/teams/#{colorado_avalanche.id}/players"
      
      expect(page).to have_content("Avalanche Roster")
      expect(page).to have_content(gabe.name)
      expect(page).to have_content(gabe.birthplace)
      expect(page).to have_content(gabe.league_award_winner)
      expect(page).to have_content(gabe.jersey_number)
      expect(page).to have_content(gabe.position)
      expect(page).to have_content(bo.name)
      expect(page).to have_content(bo.birthplace)
      expect(page).to have_content(bo.league_award_winner)
      expect(page).to have_content(bo.jersey_number)
      expect(page).to have_content(bo.position)
    end
  end

  describe "add a new player to the team" do
    # User Story 13
    it 'has a link to add new player' do
      visit "/teams/#{colorado_avalanche.id}/players"

      expect(page).to have_content("Add New Player")
    end

    it 'the link takes me to a form to add a new player' do
      visit "/teams/#{colorado_avalanche.id}/players/new"

      expect(current_path).to eq("/teams/#{colorado_avalanche.id}/players/new")
      expect(page).to have_content("New Player Information")
      expect(page).to have_content("Name")
      expect(page).to have_content("Birthplace")
      expect(page).to have_content("League Award Winner")
      expect(page).to have_content("Jersey Number")
      expect(page).to have_content("Position")
    end

    it 'can create a new child' do
      visit "/teams/#{colorado_avalanche.id}/players"

      expect(page).to_not have_content("Cale Makar")
      
      visit "/teams/#{colorado_avalanche.id}/players/new"
      # save_and_open_page
      
      fill_in("Name", with: "Cale Makar")
      fill_in("Birthplace", with: "Calgary, AB, CAN")
      fill_in("League Award Winner", with: true)
      fill_in("Jersey Number", with: 8)
      fill_in("Position", with: "Defense")
      click_button("Create New Player")
      expect(current_path).to eq("/teams/#{colorado_avalanche.id}/players")

      visit "/teams/#{colorado_avalanche.id}/players"
      expect(page).to have_content("Cale Makar")
    end
  end
end

# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed