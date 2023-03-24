class TeamsController < ApplicationController
  def index
    @teams = Team.most_recent
  end

  def show
    @teams = Team.find(params[:id])
    @players = @teams.players
  end
end