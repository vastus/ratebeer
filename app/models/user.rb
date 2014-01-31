class User < ActiveRecord::Base
  # mixins
  include RatingAverage

  # associations
  has_many(:ratings)
end

