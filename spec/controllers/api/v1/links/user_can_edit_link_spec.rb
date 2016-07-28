require "rails_helper"

RSpec.describe Api::V1::LinksController do
  describe "edit link" do
    it "a link can be edited" do
      link = FactoryGirl.create(:link)
      new_link = link.update(title:"ali")
      get :index, format: :json, link: new_link

      links = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(links.count).to eq 1
    end
  end
end
