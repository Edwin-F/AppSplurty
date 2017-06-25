require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "quote#create action form", :type => :feature do
    it "returns successfully with an HTTP 200 status code"do
      visit root_path
      within(root_path) do
        fill_in "Finish this phrase: You know you are having a Chicago Moment when...", :with => "cats"
        fill_in "Who is the author?", :with => 'Albert Einstein'
      end
      click_button "Create"
      expect(response).to have_http_status(200)
    end
  end
end
