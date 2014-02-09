require 'spec_helper'
include OwnTestHelper

describe "Rating" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }

  before do
    sign_in(user)
  end

  it "when given, is registered to the beer and user who is signed in" do
    visit new_rating_path
    select('iso 3', from: 'Beer ID')
    fill_in('rating[score]', with:'15')

    expect {
      click_button("Create Rating")
    }.to change{Rating.count}.from(0).to(1)

    expect(user.ratings.count).to eq(1)
    expect(beer1.ratings.count).to eq(1)
    expect(beer1.average_rating).to eq(15.0)
  end

  describe "index" do
    it "shows ratings name and score" do
      FactoryGirl.create(:rating, score: 10, beer: beer1, user: user)
      visit ratings_path
      expect(page).to have_content("iso 3 10")
    end

    it "shows ratings count" do
      FactoryGirl.create(:rating, score: 10, beer: beer1, user: user)
      FactoryGirl.create(:rating, score: 10, beer: beer1, user: user)
      visit ratings_path
      expect(page).to have_content("Number of ratings 2")
      expect(page).to have_content("Number of ratings 2")
    end
  end
end

