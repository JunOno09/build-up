class LikesController < ApplicationController
  def create
    # @record = Record.find(params[:record_id])
    like = current_user.likes.build(record_id: params[:record_id])
    if like.save
     redirect_back(fallback_location: root_path)
    else
      @record = like.record
      like = @record.likes
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    user=current_user
    record=Record.find(params[:record_id])
    if like=Like.find_by(user_id: user.id,record_id:record.id)
     like.destroy
     redirect_back(fallback_location: root_path)
    else
     redirect_back(fallback_location: root_path)
    end
  end
end
