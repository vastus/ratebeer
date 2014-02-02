class Membership < ActiveRecord::Base
  # associations
  belongs_to(:user)
  belongs_to(:beer_club)

  # callbacks
  before_save(:check_club_members)

  private
  def check_club_members
    beer_club = BeerClub.find(beer_club_id)
    if beer_club && beer_club.user_ids.include?(user_id)
      errors.add(:user_id, 'already in this club')
      return false
    end
  end
end

