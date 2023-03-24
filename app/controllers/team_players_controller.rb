class TeamPlayersController < ApplicationController
  def index
    @team_players = Team.find(params[:team_id])
    @players = @team_players.players
  end
end