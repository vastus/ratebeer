class BeerClubsController < ApplicationController
  def index
    @beer_clubs = BeerClub.all
  end

  def show
    @beer_club = BeerClub.find(params[:id])
    @beer_clubs = BeerClub.all
  end
end

