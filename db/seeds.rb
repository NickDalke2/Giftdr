# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name:"sam",email:"sam@sam.sam")
Person.create(name:"mark")
Interest.create(name:"coding")
ReminderType.create(event:"birthday")
PersonInterest.create(person_id:1, interest_id:1)
Reminder.create(user_id:1,reminder_type_id:1,person_id:1)
