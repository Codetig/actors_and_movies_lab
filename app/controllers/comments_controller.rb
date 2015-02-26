class CommentsController < ApplicationController

  def create
    @commentable = find_commentable
    @comment = Comment.new comment_params
    if @comment.save
      @commentable.comments << @comment
      flash[:notice]= "You're a SUPERSTAR!"
      redirect_to @commentable
    else
      flash[:notice]= "You failed dude!"
      redirect_to @commentable
    end
  end

  def index
  end

  def find_commentable
    params.each do |name, value|
    if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
    end
  end
    nil
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text)
  end
end
