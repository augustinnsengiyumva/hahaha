class RobsController < ApplicationController
  before_action :set_rob, only: [:show, :edit, :update, :destroy] 
  #before_action :Force_login
  #before_action :authenticate_user!
  #skip_before_action :verify_authenticity_token
 
  
  def index
    @rob = Rob.all
    # @search = Rob.search(params[:q])
    # @robs = @search.result
    # @favorite = Favorite.all
    # @comment = Comment.all
  end

  # Add
  
  
  def new
    if params[:back]
      @rob = Rob.new(rob_params)
    else
       @rob = Rob.new    
    end
  # @robs = Rob.new
  # @robs.user_id = current_user.id
  end
  
  def create
    @rob = Rob.new(rob_params)
    @rob.image.retrieve_from_cache! params[:cache][:image] 
    # @rob.user_id = current_user.id
    respond_to do |format|
    if @rob.save
      # Switch to the list screen and display a message saying "You have created new blog!"
       RobMailer.rob_mail(@rob).deliver
      #redirect_to robs_path, Notice: "You have created new rob!"
       format.html { redirect_to @rob, notice: 'News is successfully created.' }
      format.js { render :index }
    else
      # Redraw the input form.
     format.html { render :new }
      format.js { render :index }
    end
  end
  end
   def confirm
    @rob = Rob.new(rob_params)
     render :new if @rob.invalid?
   end
  
  def show
    # 追記する
     @robs = Rob.find(params[:id])
     @favorite = current_user.favorites.find_by(rob_id: @robs.id)
  #     @comment = @rob.comments.build
  # @comments = @rob.comments
     
  end
  def edit
     @robs = Rob.find(params[:id])
  end
    
   def update
    @robs = Rob.find(params[:id])
    if @robs.update(rob_params)
      redirect_to robs_path, Notice: "You have edited Your Account！"
    else
      render 'edit'
    end
   end
  
  def destroy
    @rob.destroy
    redirect_to robs_path, Notice: "You Have Deleted This News!"
  end
  
  
 
  #Omitted
  private
  #Before_action : Set_rob, only: [:show, :edit, :update, :destroy] 
   def rob_params
    params.require(:rob).permit(:title, :content, :image).merge(user: current_user)
   end
  
  def set_rob
    @rob = Rob.find(params[:id])
  end
  #def destroy
   # @robs.destroy
    #redirect_to robs_path, Notice: "You have deleted the rob!"
#  end
  
  
  #Omission
  
  #Omission
  #Omitted

end  