class User < ActiveRecord::Base
  # mixins
  include RatingAverage

  # auth
  has_secure_password

  # associations
  has_many(:ratings)
  has_many(:beers, through: :ratings)

  # validations
  validates(:username,
    uniqueness: true,
    length: {minimum: 3, maximum: 15})
end

