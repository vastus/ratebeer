class Rating < ActiveRecord::Base
  # associations
  belongs_to(:beer)

  def to_s
    "#{beer.name} #{score}"
  end
end

