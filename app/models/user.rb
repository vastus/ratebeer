class User < ActiveRecord::Base
  # mixins
  include RatingAverage

  # auth
  has_secure_password

  # associations
  has_many(:ratings, dependent: :destroy)
  has_many(:beers, through: :ratings)
  has_many(:memberships)
  has_many(:beer_clubs, through: :memberships)

  # validations
  validates(:username,
    uniqueness: true,
    length: { minimum: 3, maximum: 15 })
  validates(:password,
    length: { minimum: 4 },
    format: {
      with: /.*([A-Z0-9])+.*([A-Z0-9])+/,
      message: "must contain at least one number and one capital letter" })

  def favorite_beer
    if ratings.any?
      ratings.order(score: :desc).limit(1).first.beer
    end
  end
end

