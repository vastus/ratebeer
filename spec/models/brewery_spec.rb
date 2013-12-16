require 'spec_helper'

describe Brewery do
  context "Tehtävä 4" do
    it "updates updated_at when updating attributes" do
      Brewery.create!(name: "Kumpulan panimo", year: 2012)
      kumpula = Brewery.find_by_name("Kumpulan panimo")
      kumpula.update_attributes(year: 2013)
      expect(kumpula.updated_at).to_not eq(kumpula.created_at)
    end
  end
end
