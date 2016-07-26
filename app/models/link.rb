class Link < ActiveRecord::Base
  belongs_to :user
  before_validation :strip_url
  validates :url, :title, presence: true
  validates :url, presence: true, url: true

  def strip_url
    self.url = self.url.strip
  end
end
