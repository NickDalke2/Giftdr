require "rails_helper"

RSpec.describe Interest, type: :model do 
	it "is invalid without a name" do
		interest = Interest.new(name: nil)
		expect(interest).to be_invalid
	end 
end
