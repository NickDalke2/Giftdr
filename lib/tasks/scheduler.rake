desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  puts "done."
end

task :send_email => :environment do
  Reminder.all.each do |r|
    if r.when.change(hour:0) > Time.now.change(hour:0) && !r.sent && r.send_email
      ReminderMailer.reminder(r.user).deliver
      r.sent = true
      r.save
      puts "email sent"
    end
  end
end

# remove post rake task to remove sent reminders.

# loop through every user in the database
# for each user, send an email with all reminders that have not been sent.
