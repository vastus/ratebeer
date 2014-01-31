class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def create
    @rating = Rating.new(params.require(:rating).permit(:beer_id, :score))
    if @rating.save
      current_user.ratings << @rating
      redirect_to(user_url(current_user))
    else
      @beers = Beer.all
      render(:new)
    end
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete
    redirect_to(user_url(current_user))
  end
end

