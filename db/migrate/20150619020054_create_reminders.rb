class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.datetime :when
      t.boolean :send_text
      t.boolean :send_email
      t.boolean :sent
      t.references :user, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true
      t.references :reminder_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
