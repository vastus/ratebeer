Brewery.destroy_all
koff = Brewery.create!(name: "Koff", year: 1897)
stadin = Brewery.create!(name: "Stadin Panimo", year: 1997)
weihen = Brewery.create!(name: "Weihenstephan", year: 1042)

Beer.destroy_all
iso3 = Beer.create!(name: "Iso 3", style: "Lager", brewery_id: koff.id)
karhu = Beer.create!(name: "Karhu", style: "Lager", brewery_id: koff.id)


