class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true
      t.string :status
      t.string :rate

      t.timestamps
    end
  end
end
