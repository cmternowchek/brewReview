require 'rails_helper'

feature "user visits brewpub index" do
  scenario "user visits the index page" do
    visit "/"
    user = create(:user)
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button 'Log in'
    brewpub = create(:brewpub)
    visit "/"
    expect(page).to_not have_content("Yards")
    expect(page).to_not have_content("901 N Delaware Ave")
    expect(page).to_not have_content("Philadelphia")
    expect(page).to_not have_content("PA")
    expect(page).to_not have_content("19123")
    expect(page).to_not have_content("A beer co.")
    visit "/brewpubs"
    expect(page).to have_current_path("/brewpubs")
    expect(page).to have_content("Yards")
    expect(page).to have_content("901 N Delaware Ave")
    expect(page).to have_content("Philadelphia")
    expect(page).to have_content("PA")
    expect(page).to have_content("19123")
    expect(page).to have_content("A beer co.")
  end
end
