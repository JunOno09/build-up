class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @records = current_user.records
  end
end
