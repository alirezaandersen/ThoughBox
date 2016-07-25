require 'rails_helper'

RSpec.feature 'user creates an account' do
  scenario 'they successfully make an account' do
    visit '/'

    fill_in 'user_email', with: 'ali@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    click_on 'Signup'

    expect(page).to have_content("You have successfully registered ali@example.com")
  end
end
