require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "relationships" do
    it { should belong_to :team }
  end

  describe 'class methods' do
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

    let!(:cale) {colorado_avalanche.players.create!(name: "Cale Makar",
          birthplace: "Calgary, AB, CAN",
          league_award_winner: true,
          jersey_number: 8,
          position: "Defense")}

    # User Story 9
    it '#award_winner' do
      # require 'pry'; binding.pry
       expect(Player.award_winner).to eq([gabe, cale])
    end

  end
end