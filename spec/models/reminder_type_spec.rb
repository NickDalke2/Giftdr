require "rails_helper"

RSpec.describe ReminderType, type: :model do 
	it "is invalid without an event" do 
		reminder_type = ReminderType.new(event: nil)
		expect(reminder_type).to be_invalid
	end
end 
