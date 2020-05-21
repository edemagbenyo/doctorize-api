class CreateDiseases < ActiveRecord::Migration[6.0]
  def change
    create_table :diseases do |t|
      t.string :name
      t.string :description
      t.text :prevention
      t.text :treatment
      t.references :speciality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
