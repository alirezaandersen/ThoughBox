require "rails_helper"
=begin
RSpec.feature "Testing Selinum wait" do
  scenario "they see links" do
    user1 = create(:user)

    visit '/login'

    fill_in 'session_email', with: 'ali@gmail.com'
    fill_in 'session_password', with: 'password'

    click_on 'Log in'

    fill_in :link_title, with: "Vacation Plans"
    fill_in :link_url, with: "https://www.nps.gov/glac/index.htm"
    click_on "Save Link"


    driver = Selenium::WebDriver.for :firefox
    #driver.get "/links"

    visit "/links"
    p "called visit links"
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    begin
      p "inside begin"
      wait.until {driver.find_element(:class, "links")}
    ensure
      #Logger login error to text error log file
      p "inside ensure"
      p page
      within (".links") do
        expect(page).to have_content "https://www.nps.gov/glac/index.htm"
      end
      driver.quit #---------------------------> always goes to ensure and quits
    end

#    visit "links"

#    click_on "Edit"
  end

end
=end


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

    #visit "/links"

    #within (".links") do
      #expect(page).to have_content "https://www.nps.gov/glac/index.htm"
      
      save_and_open_page
      page.should have_content('https://www.nps.gov/glac/index.htm')
    #end

    visit "links"

    click_on "Edit"
  end
end
