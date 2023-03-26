class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render :index
  end

  def random
    @recipe = Recipe.order("RANDOM()").limit(1).first
    render :show
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render :show
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    if @recipe.save
      render :show
    else
      render json: { errors: @recipe.errors.full_message }
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    @recipe.save

    if @recipe.save
      render :show
    else
      render json: { errors: @recipe.errors.full_message }
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    if @recipe.delete
      render json: { message: "Recipe Sucessfully Deleted" }
    else
      render json: { errors: @recipe.delete.errors.full_message }
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :difficulty, :time_to_cook, :prep_time, :ingredients, :yield, :total_time, :chef, :category_id)
  end
end
