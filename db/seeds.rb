Brewery.destroy_all
koff = Brewery.create!(:name => "Koff", :year => 1897)
malmgard = Brewery.create!(:name => "Malmgard", :year => 2001)
weihen = Brewery.create!(:name => "Weihenstephaner", :year => 1042)

Beer.destroy_all
koff.beers.create!(:name => "Iso 3", :style => "Lager")
koff.beers.create!(:name => "Karhu", :style => "Lager")
koff.beers.create!(:name => "Tuplahumala", :style => "Lager")
malmgard.beers.create!(:name => "Huvila Pale Ale", :style => "Pale Ale")
malmgard.beers.create!(:name => "X Porter", :style => "Porter")
weihen.beers.create!(:name => "Hefezeizen", :style => "Weizen")
weihen.beers.create!(:name => "Helles", :style => "Lager")

