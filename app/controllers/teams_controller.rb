class TeamsController < ApplicationController
  def index
    @teams = Team.most_recent
  end

  def show
    @teams = Team.find(params[:id])
    @players = @teams.players
  end

  def new 
  end

  def create
    # require 'pry'; binding.pry
    team = Team.create!({
      city: params["City"],
      team_name: params["Team Name"],
      stanley_cup_champ: params["Stanley Cup Champion"],
      points: params["Points"],
      division: params["Division"]
      })
      
    team.save 

    redirect_to '/teams'
  end
  
  def edit
    @teams = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update({
      city: params["City"],
      team_name: params["Team Name"],
      stanley_cup_champ: params["Stanley Cup Champion"],
      points: params["Points"],
      division: params["Division"]
      })
    team.save

    redirect_to "/teams/#{team.id}"
  end
end