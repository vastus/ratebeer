class MembershipsController < ApplicationController
  def new
    @membership = Membership.new
    @beer_clubs = BeerClub.all
  end

  def create
    @membership = Membership.new(membership_params)
    if @membership.save && @membership.user_id != params[:user_id]
      redirect_to(beer_club_url(@membership.beer_club), notice: "Joined #{@membership.beer_club.name}")
    else
      redirect_to(:back, notice: "You are already a member of this club")
    end
  end

  private
  def membership_params
    params.require(:membership).permit(:user_id, :beer_club_id)
  end
end

