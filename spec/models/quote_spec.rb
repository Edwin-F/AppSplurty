require 'rails_helper'

RSpec.describe Quote, type: :model do
  context "with 2 or more comments" do
    it "orders them in reverse chronologically" do      
      quote1 = Quote.create!(:saying => "first quote", :author => "Author1")
      quote2 = Quote.create!(:saying => "second quote", :author => "Author2")
      expect(Quote.all).to eq([quote1, quote2])
    end
  end

  context "saying" do
    it "is required" do
      quote_1 = Quote.new(:author =>"Author1")
      quote_1.valid?
      expect(quote_1.errors.full_messages).to include("Saying can't be blank")
    end
  end

end
