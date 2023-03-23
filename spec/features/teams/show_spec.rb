#spec/features/teams/show_spec.rb
require 'rails_helper'

RSpec.describe "/parents/:id" do
  describe "as a visitor when I visit the teams show page it shows me thier team info" do
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

    it 'shows team data' do
      # User Story 2
      visit "/teams/#{colorado_avalanche.id}"
      
      expect(page).to have_content("Team Show Page")
      expect(page).to have_content(colorado_avalanche.city)
      expect(page).to have_content(colorado_avalanche.team_name)
      expect(page).to have_content(colorado_avalanche.stanley_cup_champ)
      expect(page).to have_content(colorado_avalanche.points)
      expect(page).to have_content(colorado_avalanche.division)
      expect(page).not_to have_content(seattle_kraken.city)
    end
  end
end

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)