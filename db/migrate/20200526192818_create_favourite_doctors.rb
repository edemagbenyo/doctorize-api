class CreateFavouriteDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :favourite_doctors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
