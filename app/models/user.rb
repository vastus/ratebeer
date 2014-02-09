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

  def favorite_style
    if ratings.any?
      points_for_styles.sort_by do |s, p|
        p
      end.last[0]
    end
  end

  def points_for_styles
    styles = {}
    counts = {}
    ratings.each do |r|
      style = r.beer.style
      if styles[style].nil?
        styles[style] = r.score
        counts[style] = 1
      else
        styles[style] += r.score
        counts[style] += 1
      end
    end
    return means_for_styles(styles, counts)
  end

  def means_for_styles(styles, count)
    styles.keys.each do |s|
      styles[s] = styles[s] / count[s].to_f
    end
    return styles
  end
end

