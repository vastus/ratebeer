class User < ActiveRecord::Base
  # mixins
  include RatingAverage

  # associations
  has_many(:ratings)

  # validations
  validates(:username,
    uniqueness: true,
    length: { minimum: 3})
end

