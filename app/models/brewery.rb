class Brewery < ActiveRecord::Base
  # mixins
  include RatingAverage

  # associations
  has_many(:beers, dependent: :destroy)
  has_many(:ratings, through: :beers)

  # validations
  validates(:name,
    presence: true)
  validates(:year,
    numericality: {
      greater_than_or_equal_to: 1042,
      less_than_or_equal_to: lambda { |y| Time.now.year },
      only_integer: true})
end

