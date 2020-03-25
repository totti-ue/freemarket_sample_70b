class UsersController < ApplicationController
  before_action :set_params, only: :show
  
  def new
  end


  def create
    params[:user][:birthday] 
    @user = User.new(user_params)
  end

  def show
  end
  
 private 
   def user_params
     params.require(:user).permit(:birthday)
   end

   def set_params
    @user = User.find(params[:id])
   end

end
