require 'rails_helper'

RSpec.feature 'user cannot create an account' do
scenario 'they unsuccessfully create an account' do
    visit '/'

    fill_in 'user_email', with: 'ali@gmail.com'
    fill_in 'user_password', with: 'pass'
    fill_in 'user_password_confirmation', with: 'pass'

    click_on 'Signup'

    expect(page).to have_content("Invalid email and/or password combination")
  end
end
