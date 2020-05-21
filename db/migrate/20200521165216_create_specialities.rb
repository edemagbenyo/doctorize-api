class CreateSpecialities < ActiveRecord::Migration[6.0]
  def change
    create_table :specialities do |t|
      t.string :name
      t.text :description
      t.string :created_by

      t.timestamps
    end
  end
end
