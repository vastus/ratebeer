class Membership < ActiveRecord::Base
  # associations
  belongs_to(:user)
  belongs_to(:beerclub)
end

