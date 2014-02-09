require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it "has the username set correctly" do
    user = User.new username:"Pekka"
    user.username.should == "Pekka"
  end

  it "is not saved without a password" do
    user = User.create username:"Pekka"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  describe "with an incorrect password" do
    let(:user_with_too_short_pw) { User.new(username: "Bob", password: "pw", password_confirmation: "pw") }
    let(:user_with_letters_only_pw) { User.new(username: "Bob", password: "pw", password_confirmation: "pw") }
    
    it "is not saved when password is too short" do
      expect(user_with_too_short_pw).not_to be_valid
      user_with_letters_only_pw.save
      expect(User.count).to eq(0)
    end

    it "is not saved when password contains only letters" do
      expect(user_with_letters_only_pw).not_to be_valid
      user_with_letters_only_pw.save
      expect(User.count).to eq(0)
    end
  end

  describe "with a proper password" do
    it "is saved" do
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end

    it "and with two ratings, has the correct average rating" do
      user.ratings << FactoryGirl.create(:rating)
      user.ratings << FactoryGirl.create(:another_rating)

      expect(user.ratings.count).to eq(2)
      expect(user.average_rating).to eq(15.0)
    end
  end

  describe "favorite beer" do

    it "has a method for determining one" do
      user.should respond_to(:favorite_beer)
    end

    it "does not have one w/o ratings" do
      expect(user.favorite_beer).to eq(nil)
    end

    it "is the only rated if only one rating" do
      beer = FactoryGirl.create(:beer)
      rating = FactoryGirl.create(:rating, beer: beer, user: user)
      expect(user.favorite_beer).to eq(beer)
    end

    it "is the one with highest rating if several rated" do
      create_beers_with_ratings(10, 20, 15, 7, 9, user)
      best = create_beer_with_rating(25, user)
      expect(user.favorite_beer).to eq(best)
    end
  end
end

def create_beers_with_ratings(*scores, user)
  scores.each do |score|
    create_beer_with_rating score, user
  end
end

def create_beer_with_rating(score,  user)
  beer = FactoryGirl.create(:beer)
  FactoryGirl.create(:rating, score:score,  beer:beer, user:user)
  beer
end

