class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.integer :difficulty
      t.string :time_to_cook
      t.string :prep_time
      t.string :ingredients
      t.string :yeild
      t.string :total_time
      t.string :chef

      t.timestamps
    end
  end
end
