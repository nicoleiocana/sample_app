class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def index
    if params[:tag]
      @microposts = Micropost.tagged_with(params[:tag]).paginate(page: params[:page])
      @tag = Tag.find_by!(name: params[:tag])
    else
      redirect_to root_path
    end
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end 

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
    def micropost_params
      params.require(:micropost).permit(:content, :picture, :tag_list)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_path if @micropost.nil?
    end
end
