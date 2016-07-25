require 'rails_helper'

RSpec.feature "user can sign in and out" do 
scenario 'they sign into existing account and logout' do
    user1 = create(:user, email: 'ali@gmail.com')

    visit '/login'

    fill_in 'session_email', with: 'ali@gmail.com'
    fill_in 'session_password', with: 'password'

    click_on 'Log in'

    expect(page).to have_content("Welcome back, ali@gmail.com")

    click_on 'logout'

    expect(page).to have_content("You have successfully logged out ali@gmail.com")
  end
end
