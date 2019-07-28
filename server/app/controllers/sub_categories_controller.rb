class SubCategoriesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])

    @sub_category = @category.sub_categories.build(sub_category_params)
    if @sub_category.save
      redirect_to category_sub_categories_path(@category)
    else
      render category_sub_categories_path(@category)
    end
  end

  def update
    @sub_category = SubCategory.find(params[:id])

    if @sub_category.update(sub_category_params)
      redirect_to category_sub_categories_path(@sub_category.category_id)
    else
      render category_sub_categories_path(@sub_category.category_id)
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def sub_category_params
    params.require(:sub_category).permit(:name)
  end
end
