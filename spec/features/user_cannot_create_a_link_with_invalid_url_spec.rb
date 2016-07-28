require "rails_helper"

RSpec.feature "Authenticated user can create and save a link" do
  scenario "they see links" do
    user1 = create(:user, email: 'ali@gmail.com')

    visit '/login'

    fill_in 'session_email', with: 'ali@gmail.com'
    fill_in 'session_password', with: 'password'

    click_on 'Log in'

    fill_in :link_title, with: "Vacation Plans"
    fill_in :link_url, with: "htt/www.nps.gov/glac/index.htm"
    click_on "Save Link"

    expect(page).to have_content "Url is not a valid URL"
  end
end
