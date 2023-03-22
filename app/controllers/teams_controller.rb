class TeamsController < ApplicationController
 def index
  @teams = Team.all
  # require 'pry'; binding.pry
 end
end