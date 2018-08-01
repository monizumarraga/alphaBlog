require 'will_paginate/array'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  
  def index
    @users=User.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
  end
  
  def new
  	@boton="Create"
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      flash[:success] = "Welcome to the alphaBlog #{@user.username}"
      redirect_to user_path(@user)
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
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:danger] = "User was successfully deleted"
    redirect_to users_path
  end
  
  def welcome
    @seluser=User.find(params[:format])
  end
  
  def about
    @seluser=User.find(params[:format])
  end
  
  def profile
    @seluser=User.find(params[:format])
  end
  
  def contactme
    @seluser=User.find(params[:format])
    @message = Message.new
  end
  
  def details
    @seluser=User.find(params[:format])
    @category=Category.find_by(name: params[:name])
    relation= ArticleCategory.where(category_id: @category.id)
    if relation 
      @articles= @seluser.articles.where(id: relation.pluck(:article_id)).reverse
    else
    end
  end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:username, :email, :password, :phone)
    end
    
    def require_same_user
        if current_user != @user and !current_user.admin?
          flash[:danger] = "You can only edit or delete your own account"
          redirect_to root_path
        end
    end
    
    def require_admin
      if logged_in? and !current_user.admin?
        flash[:danger] = "Only admin users can perform that action"
        redirect_to root_path
      end
    end
end
