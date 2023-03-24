class Team < ApplicationRecord
  has_many :players

  def self.most_recent
    # require 'pry'; binding.pry
    order("created_at desc")
  end
end