require 'rails_helper'

RSpec.feature 'existing user cannot signup again' do
  scenario 'user cant sign into existing account' do
      user1 = create(:user, email: 'ali@gmail.com')

      visit '/'

      fill_in 'user_email', with: 'ali@gmail.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'

      click_on 'Signup'

      expect(page).to have_content("Invalid email and/or password combination")
    end
  end
