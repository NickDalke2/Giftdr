class CreatePersonInterests < ActiveRecord::Migration
  def change
    create_table :person_interests do |t|
      t.references :person, index: true, foreign_key: true
      t.references :interest, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
