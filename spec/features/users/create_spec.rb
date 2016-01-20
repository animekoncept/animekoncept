require 'rails_helper'

RSpec.feature "User", :type =>:feature do
  scenario "Create a new user" do
    visit "/users/sign_up"

    fill_in "Username", :with => "username"
    fill_in "Email", :with => "email@email.com"

    click_button "Sign up"

    expect(page).to have_text("Username")
  end
end
