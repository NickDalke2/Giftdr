require "rails_helper"  

RSpec.describe RemindersController do

	render_views 

 	describe "GET index" do
 		"it collects reminders into @reminders" do
 			reminder = Reminder.create
end