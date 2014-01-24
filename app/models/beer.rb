class Beer < ActiveRecord::Base
  # associations
  belongs_to(:brewery)

  has_many(:ratings)

  def average_rating
    ratings.average(:score).to_f.round(2)
  end
end

