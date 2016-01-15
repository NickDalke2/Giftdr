class ReminderType < ActiveRecord::Base
	validates :event, presence: true 
	has_many :reminders
end
