# spec/features/players/show_spec.rb
require 'rails_helper'

RSpec.describe "/players/:id" do
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

  describe 'as a visitor, when I visit the players show page' do
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

  describe 'Updating a player' do
    # User Story 14
    it 'in the child show page it shows a link to update the child' do
      visit "/players/#{gabe.id}"
      
      expect(page).to have_link("Update Player")

      click_on "Update Player"

      expect(current_path).to eq("/players/#{gabe.id}/edit")
    end

    it 'on the player edit page it shows a form to update the player' do
      visit "/players/#{gabe.id}/edit"

      expect(page).to have_content("Edit Player Details")
      expect(page).to have_field("Name")
      expect(page).to have_field("Birthplace")
      expect(page).to have_content("League Award Winner")
      expect(page).to have_field("Jersey Number")
      expect(page).to have_field("Position")
      expect(page).to have_button("Update Player")
      
      click_on "Update Player"
      expect(current_path).to eq("/players/#{gabe.id}")
    end 

    it 'updated the player info' do
      visit "/players/#{gabe.id}"

      expect(page).to_not have_content("Malmo, SWE")

      visit "/players/#{gabe.id}/edit"

      fill_in("Birthplace", with: "Malmo, SWE")

      click_button "Update Player"
      expect(current_path).to eq("/players/#{gabe.id}")

      visit "/players/#{gabe.id}"
      expect(page).to have_content("Malmo, SWE")
    end
  end
end

# User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information