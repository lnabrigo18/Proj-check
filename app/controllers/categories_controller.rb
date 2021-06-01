class CategoriesController < ApplicationController
  # before_action :require_admin, except: [:index, :show]
  before_action :authenticate_user!

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category name updated successfully"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def index
    @categories = current_user.categories.all.order(created_at: :desc)
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
  
  def dashboard
    # @categories = current_user.categories.all.order(created_at: :desc)
    @tasks = Task.all
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

end