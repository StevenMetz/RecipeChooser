class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(:id)
  end

  def create
    @category = Category.new(category_params)
    @category.save

    if @category.save
      render json: @category.as_json
    else
      render json: { errors: @category.errors.full_message }
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    @category.save

    if @category.save
      render json: @category.as_json
    else
      render json: { errors: @category.errors.full_message }
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.delete
    if @category.delete
      render json: { message: "Category Removed" }
    else
      render json: { errors: @category.errors.full_message }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
