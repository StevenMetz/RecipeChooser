class RemoveRecipeIdFromCategoriesAddCategoryIdToRecipe < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :recipe_id
    add_column :recipes, :category_id, :integer
  end
end
