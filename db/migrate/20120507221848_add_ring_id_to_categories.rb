class AddRingIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :ring_id, :integer
    add_index :categories, :ring_id
  end
end
