class Api::V1::SubCategoriesController < ApplicationController
  def index
    SubCategory.all
  end
end
