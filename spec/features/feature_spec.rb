require 'rails_helper'

RSpec.feature "Homepage", :type => :feature do
  before do
    @quote = Quote.create(saying: "the city is on fire", author: "Abe")
  end

  scenario "visit the homepage" do
    visit root_path
    #save_and_open_page
    expect(page).to have_content("You know you are having a Chicago Moment when...")
  end

  describe "Home Page" do
    it "will visit root_path" do
      visit root_path
      expect(current_path). to eql root_path
    end
  end

  describe "quote#create action form" do
    it "returns successfully with an HTTP 200 status code"do
      p Quote.all
      visit root_path
      #within(root_path) do
        click_on "Contribute"
        fill_in "Finish this phrase: You know you are having a Chicago Moment when...", :with => "cats"
        fill_in "Who is the author?", :with => 'Einstein'
      #end
      click_button "Create"
      puts " "
      p Quote.all
      expect(Quote.count).to eq 2
    end
  end
end