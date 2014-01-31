class Rating < ActiveRecord::Base
  # associations
  belongs_to(:beer)
  belongs_to(:user)

  def to_s
    "#{beer.name} #{score}"
  end
end

