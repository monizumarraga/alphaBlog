class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @articles=Article.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
  end
  
  def course
    @articles=Article.where(user_id: current_user.id , category: 'Course').paginate(page: params[:page], per_page: 5)
  end
  
  def education
    @articles=Article.where(user_id: current_user.id , category: 'Education').paginate(page: params[:page], per_page: 5)
  end
  
  def project
    @articles=Article.where(user_id: current_user.id , category: 'Project').paginate(page: params[:page], per_page: 5)
  end
  
  def computer
    @articles=Article.where(user_id: current_user.id , category: 'Computer skill').paginate(page: params[:page], per_page: 5)
  end
  
  def new
  	@boton="Create"
    @article = Article.new
  end

  def create
  	@boton="Create"
    @article = Article.new(article_params)
    @article.user=current_user
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  	@boton="Update"
  end
  
  def update
  	@boton="Update"
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
    private
  
    def set_article
      @text= params[:id]
      if @text!='course' && @text!='education' && @text!='computer' && @text!='project'
        @article = Article.find(params[:id])
      end
    end
    
    def article_params
      params.require(:article).permit(:title, :description, :category, :date, :user_id, category_ids:[])
    end
    
    def require_same_user
        if current_user!=@article.user and !current_user.admin?
          flash[:danger] = "You can only edit or delete your own articles"
          redirect_to root_path
        end
    end
end
