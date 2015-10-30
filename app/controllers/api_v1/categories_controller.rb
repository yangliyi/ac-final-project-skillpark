class ApiV1::CategoriesController < ApiController
  def index
    @categories = Category.all
  end
end
