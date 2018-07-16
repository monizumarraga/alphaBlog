class DetailsController < ApplicationController
  before_action :set_Detail, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [ :edit, :update, :destroy]
  
  def index
    @details= Detail.all
  end
  
  def new
  	@boton="Create"
    @detail = Detail.new
  end

  def create
  	@boton="Create"
    @detail = Detail.new(detail_params)
    @detail.user=current_user
    if @detail.save
      flash[:success] = "Detail was successfully created"
      redirect_to detail_path(@detail)
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
    if @detail.update(detail_params)
      flash[:success] = "Detail was successfully updated"
      redirect_to details_path(@detail)
    else
      render 'edit'
    end
  end

  def destroy
    @detail.destroy
    flash[:danger] = "Detail was successfully deleted"
    redirect_to details_path
  end
  
    private
  
    def set_Detail
        @detail = Detail.find(params[:id])
    end
    
    def detail_params
      params.require(:detail).permit(:welcome, :aboutMe, :profile, :fb, :instagram, :linkedin, :github, :user_id)
    end
    
    def require_same_user
        if current_user!=@detail.user
          flash[:danger] = "You can only create, edit or delete your own Details"
          redirect_to root_path
        end
    end
end
