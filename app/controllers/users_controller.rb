class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  def new
  	@boton="Create"
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the alphaBlog #{@user.username}"
      session[:user_id] = user.id
      redirect_to articles_path
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
    redirect_to Users_path
  end
  
    private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
