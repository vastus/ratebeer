class Beer < ActiveRecord::Base
  # mixins
  include RatingAverage

  # associations
  belongs_to(:brewery)

  has_many(:ratings, dependent: :destroy)

  # validations
  validates(:name,
    presence: true)

  def to_s
    "#{brewery.name}'s #{name}"
  end
end

