class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :require_admin, except: [:index, :show]
    
    def index
      @categories= Category.paginate(page: params[:page], per_page: 5)
    end
    
    def new
    	@boton="Create"
      @category = Category.new
    end

  def create
  	@boton="Create"
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was successfully created"
      redirect_to categories_path(@category)
    else
      render 'new'
    end
  end
    
  def edit
  	@boton="Update"
  end
  
  def update
  	@boton="Update"
    if @category.update(category_params)
      flash[:success] = "Category was successfully updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
    end
    
    def show
    end
    
    private
  
    def set_category
      @text= params[:id]
      if @text!='course' && @text!='education' && @text!='computer' && @text!='project'
        @category = Category.find(params[:id])
      end
    end
    
    def category_params
      params.require(:category).permit(:name)
    end
    
    def require_admin
      if !logged_in? || (logged_in? and !current_user.admin?)
        flash[:danger] = "Only admin users can perform that action"
        redirect_to categories_path
      end
    end
end
