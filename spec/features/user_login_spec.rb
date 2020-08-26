require 'rails_helper'

RSpec.feature "Visitor navigates to product details", type: :feature, js: true do
   # SETUP
   before :each do
    @user = User.new
    @user.first_name = "user"
    @user.last_name = "name"
    @user.email = "user@example.com"
    @user.password = "password"
    @user.save!
  end

  scenario "We are able to log a user in" do
    # ACT
    visit sign_in_users_path	

    within('form#new_user') do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end

    click_button("Sign In")

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content("Logged in successfully")


  end

end