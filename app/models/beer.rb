class Beer < ActiveRecord::Base
  # associations
  belongs_to(:brewery)

  has_many(:ratings)
end

