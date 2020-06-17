class AddDetailsToDoctor < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :city, :string
    add_column :doctors, :region, :string
    add_column :doctors, :country, :string
  end
end
