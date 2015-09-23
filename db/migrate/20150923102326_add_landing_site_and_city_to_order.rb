class AddLandingSiteAndCityToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :landing, :string
    add_column :orders, :site, :string
    add_column :orders, :city, :string
  end
end
