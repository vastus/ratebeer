Brewery.destroy_all
koff = Brewery.create!(:name => "Koff", :year => 1897)
malmgard = Brewery.create!(:name => "Malmgard", :year => 2001)
weihen = Brewery.create!(:name => "Weihenstephaner", :year => 1042)
brewdog = Brewery.create!(name: "BrewDog", year: 2007)

Beer.destroy_all
iso3 = koff.beers.create!(:name => "Iso 3", :style => "Lager")
karhu = koff.beers.create!(:name => "Karhu", :style => "Lager")
tupla = koff.beers.create!(:name => "Tuplahumala", :style => "Lager")
huvila = malmgard.beers.create!(:name => "Huvila Pale Ale", :style => "Pale Ale")
xporter = malmgard.beers.create!(:name => "X Porter", :style => "Porter")
hefe = weihen.beers.create!(:name => "Hefezeizen", :style => "Weizen")
helles = weihen.beers.create!(:name => "Helles", :style => "Lager")
punk = brewdog.beers.create!(name: "Punk IPA", style: "IPA")
nanny = brewdog.beers.create!(name: "Nanny State", style: "lowalcohol")

Rating.destroy_all
iso3.ratings.create!(score: 10)
iso3.ratings.create!(score: 21)
iso3.ratings.create!(score: 17)
punk.ratings.create!(score: 39)
punk.ratings.create!(score: 25)
punk.ratings.create!(score: 45)
nanny.ratings.create!(score: 14)
nanny.ratings.create!(score: 21)

