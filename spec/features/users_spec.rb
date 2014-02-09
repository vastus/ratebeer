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
end

