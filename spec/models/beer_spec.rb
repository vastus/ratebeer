require 'spec_helper'

describe Beer do
  let(:beer) { Beer.new(name: "Beer", style: "Lager") }

  it "is valid w/ correct attributes" do
    expect(beer).to be_valid
  end

  it "saves with correct attributes" do
    beer.save
    expect(Beer.count).to eq(1)
  end

  it "does not save w/o name" do
    Beer.create(style: "Lager")
    expect(Beer.count).to eq(0)
  end

  it "does not save w/o style" do
    Beer.create(name: "Beer")
    expect(Beer.count).to eq(0)
  end
end

