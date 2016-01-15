class Reminder < ActiveRecord::Base
	validates :when, presence: true

  belongs_to :user
  belongs_to :person
  belongs_to :reminder_type
end
