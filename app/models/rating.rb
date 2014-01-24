class Rating < ActiveRecord::Base
  # associations
  belongs_to(:beer)
end

