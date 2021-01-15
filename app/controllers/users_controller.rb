class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @records = @user.records
    @users = @records.page(params[:page]).per(5)
    
  end
  
end
