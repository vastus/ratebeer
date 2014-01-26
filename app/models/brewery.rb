class Brewery < ActiveRecord::Base
  # mixins
  include RatingAverage

  # associations
  has_many(:beers, dependent: :destroy)
  has_many(:ratings, through: :beers)
end

