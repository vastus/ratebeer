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

  context "Tehtävä 5" do
    describe "creation" do
      let(:beer) { Beer.new(name: "Bizz", style: "Lager") }
      let(:hartwall) { Brewery.create!(name: "Hartwall", year: 9001) }

      before { expect(hartwall.beers.count).to eq(0) }
      after { expect(hartwall.beers.count).to eq(1) }

      it "by assigning brewery to beer" do
        beer.brewery = hartwall
        beer.save!
      end

      it "from .beers" do
        hartwall.beers.create!(name: beer.name, style: beer.style)
      end

      it "by shovel operator" do
        hartwall.beers << beer
      end

      # Tuhoaminen
      # Beer.where(:brewery => hartwall).map(&:destroy)
    end
  end
end

