module RatingAverage
  def average_rating
    ratings.average(:score).to_f().round(2)
  end
end

