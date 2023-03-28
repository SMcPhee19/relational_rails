require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "relationships" do
    it { should have_many :players }
  end

  describe 'class methods' do
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

      # User Story 6
    it '#most_recent' do
      expect(Team.most_recent).to eq([seattle_kraken, colorado_avalanche])
    end

    #User Story 7
    it '#roster_count' do
      expect(colorado_avalanche.roster_count).to eq(2)
    end
  end
end

