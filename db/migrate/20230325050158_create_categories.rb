class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.integer :recipe_id

      t.timestamps
    end
  end
end
