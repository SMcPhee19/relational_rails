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
      # save_and_open_page
      expect(page).to have_content("Colorado Avalanche Players")
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
end

# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)
# ActiveRecord