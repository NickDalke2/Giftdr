class ReminderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder_mailer.reminder.subject
  #
  def reminder user
    @greeting = "Hi! #{user.name}"
    @user = user
    mail to: user.email
  end
end
