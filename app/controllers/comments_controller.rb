class CommentsController < ApplicationController
  

    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to record_path(@comment.record)
      else
        @record = @comment.record
        @comments = @record.comments
         render "records/show" 
      end
    end
  
    def destroy
      @record = Record.find(params[:record_id])
      comment = @record.comments.find(params[:id])
      if current_user.id == comment.user.id
        comment.destroy
      redirect_back(fallback_location: root_path)
      else
        render "records/show"
      end
      
    end

    private
    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, record_id: params[:record_id]) 
    end

    
end
  
