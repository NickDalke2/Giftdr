class CreateReminderTypes < ActiveRecord::Migration
  def change
    create_table :reminder_types do |t|
      t.string :event

      t.timestamps null: false
    end
  end
end
