require 'spec_helper'
include OwnTestHelper

describe "User" do
  let!(:user) { FactoryGirl.create(:user) }

  describe "who has signed up" do
    it "can signin with right credentials" do
      sign_in(user)
      expect(page).to have_content 'welcome back!'
      expect(page).to have_content 'Testos'
    end

    it "is redirected back to signin form if wrong credentials given" do
      user.password = "Wrong"
      sign_in(user)
      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'username and/or password mismatch'
    end

    it "when signed up with good credentials, is added to the system" do
      visit signup_path
      fill_in('user_username', with: 'Brian')
      fill_in('user_password', with: 'Secret55')
      fill_in('user_password_confirmation', with: 'Secret55')

      expect do
        click_button('Save')
      end.to change{User.count}.by(1)
    end
  end

  describe "show page" do
    let(:beer) { FactoryGirl.create(:beer, name: "Wheat", style: "Wheat") }
    before { sign_in(user) }

    it "shows ratings done by user" do
      FactoryGirl.create(:rating, score: 10, user: user, beer: beer)
      FactoryGirl.create(:rating, score: 15, user: user, beer: beer)
      FactoryGirl.create(:rating)
      visit user_path(user.id)
      expect(page).to have_content("Has 2 ratings")
      expect(page).to have_content("Wheat 10")
      expect(page).to have_content("Wheat 15")
    end

    it "can remove ratings" do
      FactoryGirl.create(:rating, score: 10, user: user, beer: beer)
      visit user_path(user.id)
      click_link('delete')
      expect(page).to have_content('Has no ratings')
    end

    it "shows favorite style of beer" do
      FactoryGirl.create(:rating, score: 10, user: user, beer: beer)
      visit user_path(user.id)
      expect(page).to have_content("Favorite style of beer: Wheat")
    end

    it "shows favorite brewery" do
      FactoryGirl.create(:rating, score: 10, user: user, beer: beer)
      visit user_path(user.id)
      expect(page).to have_content("Favorite brewery: anonymous")
    end
  end
end

