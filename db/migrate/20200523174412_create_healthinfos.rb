class CreateHealthinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :healthinfos do |t|
      t.string :age
      t.string :gender
      t.string :weight
      t.string :height
      t.text :family
      t.text :personal
      t.text :text1
      t.text :text2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
