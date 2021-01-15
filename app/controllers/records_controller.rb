class RecordsController < ApplicationController
  before_action :set_record, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @records = Record.includes(:user).order("created_at DESC")
    @records = Record.page(params[:page]).per(10)
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to root_path
    else
      render :new
   end
  end

  def show
    @comment = Comment.new
    @comments = @record.comments.includes(:user)
    # @like = Like.new
    #  @likes = @record.likes.includes(:user)
  end

  def edit
    unless current_user == @record.user
      redirect_to root_path
    end
  end

  def update
    if current_user.id == @record.user_id && @record.update(record_params) 
    redirect_to record_path
    else 
      render:edit
    end
  end

  def destroy
    if current_user.id == @record.user_id && @record.destroy
    redirect_to root_path
    end
  end


  private
  def record_params
    params.require(:record).permit(:tr_theme, :tr_content, :category_id, :evaluation_id, :tr_day, :mvp, :mvp_reason, :image, :event).merge(user_id: current_user.id)
  end

  def set_record
    @record = Record.find(params[:id])
  end

end
