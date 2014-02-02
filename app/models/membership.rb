class Membership < ActiveRecord::Base
  # associations
  belongs_to(:user)
  belongs_to(:beer_club)
end

