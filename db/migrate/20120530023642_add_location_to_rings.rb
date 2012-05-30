class AddLocationToRings < ActiveRecord::Migration
  def change
    add_column :rings, :latitude, :float
    add_column :rings, :longitude, :float
  end
end
