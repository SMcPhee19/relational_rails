class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @players = Player.find(params[:id])
  end

  def edit
    @players = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update({
      name: params["Name"],
      birthplace: params["Birthplace"],
      league_award_winner: params["League Award Winner"],
      jersey_number: params["Jersey Number"],
      position: params["Position"]})

    player.save

    redirect_to "/players/#{player.id}"
  end
end