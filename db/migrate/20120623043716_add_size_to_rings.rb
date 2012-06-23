class AddSizeToRings < ActiveRecord::Migration
  def change
    add_column :rings, :size, :integer
  end
end
