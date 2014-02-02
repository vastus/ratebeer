class BeerClub < ActiveRecord::Base
  # associations
  has_many(:memberships)
  has_many(:users, through: :memberships)

  # validations
  validates(:name, presence: true)
  validates(:founded,
    presence: true,
    numericality: { only_integer: true })
  validates(:city, presence: true)
end

