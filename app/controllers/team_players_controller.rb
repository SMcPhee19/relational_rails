class TeamPlayersController < ApplicationController
  def index
    @team_players = Team.find(params[:id])
    @players = @team_players.players
  end

  def new
    @team_players = Team.find(params[:id])
  end

  def create
    @team_players = Team.find(params[:id])
    @team_players.players.create!({
      name: params["Name"],
      birthplace: params["Birthplace"],
      league_award_winner: params["League Award Winner"],
      jersey_number: params["Jersey Number"],
      position: params["Position"]
      })
      
    redirect_to "/teams/#{@team_players.id}/players"
  end
end