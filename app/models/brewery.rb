class Brewery < ActiveRecord::Base
  # associations
  has_many(:beers, dependent: :destroy)
  has_many(:ratings, through: :beers)

  def average_rating
    ratings.average(:score).to_f.round(2)
  end
end

