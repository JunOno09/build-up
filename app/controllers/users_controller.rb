class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @records = current_user.records
  end
end
