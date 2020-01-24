class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comment.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:danger] = "コメント投稿できませんでした"
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment,:topic_id)
  end

  
end
