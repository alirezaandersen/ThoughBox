RSpec.describe LinksController do
  describe "creates a link", type: :controller do
    it "creates a link valid link" do
    link = FactoryGirl.create(:link)

    expect(response).to have_http_status(:success)
    # link.should include(:title, :url)
    end
  end
end
