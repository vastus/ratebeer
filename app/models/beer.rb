class Beer < ActiveRecord::Base
  # mixins
  include RatingAverage

  # associations
  belongs_to(:brewery)
  has_many(:ratings, dependent: :destroy)
  has_many(:raters, through: :ratings, source: :user)

  # validations
  validates(:name,
    presence: true)

  def to_s
    "#{brewery.name}'s #{name}"
  end
end

