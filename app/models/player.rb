class Player < ApplicationRecord
  belongs_to :team

  def self.award_winner
    where("league_award_winner = true")
  end
end