class CreateRings < ActiveRecord::Migration
  def change
    create_table :rings do |t|
      t.string :name

      t.timestamps
    end
  end
end
