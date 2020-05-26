class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.text :info
      t.string :meeting_link
      t.string :guest
      t.date :date
      t.time :time
      t.string :status

      t.timestamps
    end
  end
end
