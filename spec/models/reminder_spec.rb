require "rails_helper"

RSpec.describe Reminder, type: :model do 
	it "is invalid without a date" do
		reminder = Reminder.new(:when => nil) 
		expect(reminder).to be_invalid
	end 

	# it "is invalid with a date that's passed already" do
	# 	reminder = Reminder.new(:when => Time.now - 3000)  
	# 	expect(reminder).to be_invalid 
	# end 
end