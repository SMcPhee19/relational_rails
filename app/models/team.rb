class Team < ApplicationRecord
  has_many :players

  def self.most_recent
    order("created_at desc")
  end

  def roster_count
    self.players.count
  end
end