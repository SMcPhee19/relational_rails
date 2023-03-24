class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @players = Player.find(params[:id])
  end
end