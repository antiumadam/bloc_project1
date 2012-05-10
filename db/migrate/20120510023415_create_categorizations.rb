class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :ring_id
      t.integer :category_id

      t.timestamps
    end
  end
end
