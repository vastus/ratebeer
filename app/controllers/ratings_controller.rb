class RatingsController < ApplicationController
  before_action(:authorize, except: [:index])

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
    rating.delete if current_user == rating.user
    redirect_to(:back)
  end

  private
  def authorize
    unless current_user
      redirect_to(signin_url, notice: 'You have to sign in to do that')
    end
  end
end

