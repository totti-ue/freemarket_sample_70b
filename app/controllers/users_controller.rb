class UsersController < ApplicationController

  def new
  end


  def create
    params[:user][:birthday] = birthday_join
    @user = User.new(user_params)
  end

  def show
  end
  
 private 
   def user_params
     params.require(:user).permit(:birthday)
   end
 
   def birthday_join
     # パラメータ取得
     date = params[:user][:birthday]
 
     # ブランク時のエラー回避のため、ブランクだったら何もしない
     if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
       return
     end
 
     # 年月日別々できたものを結合して新しいDate型変数を作って返す
     Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
 
   end
end
