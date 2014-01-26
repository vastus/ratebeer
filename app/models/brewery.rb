class Brewery < ActiveRecord::Base
  # associations
  has_many(:beers, dependent: :destroy)
  has_many(:ratings, through: :beers)
end

