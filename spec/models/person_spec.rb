require "rails_helper"

RSpec.describe Person, type: :model do 
	it "is invalid without a name" do
		person = Person.new(name: nil)
		expect(person).to be_invalid
	end
	it "is valid with a name" do
		person = Person.new(name: "John")
		expect(person).to be_valid
	end
end