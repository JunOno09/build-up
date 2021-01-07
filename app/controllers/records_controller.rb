class RecordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
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

  private
  def record_params
    params.require(:record).permit(:tr_theme, :tr_content, :category_id, :evaluation_id, :tr_day, :mvp, :mvp_reason, :image, :event).merge(user_id: current_user.id)
  end
end
