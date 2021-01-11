class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    #  @record = Record.find(params[:id])
    @user = User.find(params[:id])
    @records = @user.records
  end


  def destroy
    @user = User.find(params[:id])
    @records = @user.records
    @comments = @user.comments
  end
end
