require "rails_helper"

RSpec.feature "Authenticated user can create and save a link" do
  scenario "they see links" do
    user1 = create(:user)

    visit '/login'

    fill_in 'session_email', with: 'ali@gmail.com'
    fill_in 'session_password', with: 'password'

    click_on 'Log in'

    fill_in :link_title, with: "Vacation Plans"
    fill_in :link_url, with: "https://www.nps.gov/glac/index.htm"
    click_on "Save Link"

    visit "/links"

    page.should have_content('https://www.nps.gov/glac/index.htm')
    page.should have_button('Edit')
    page.should have_button('Mark as Unread')
    page.should have_button('Mark as Read')

    click_on "Edit"
  end
end
