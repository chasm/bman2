class CommentsController < ApplicationController
  before_action :get_parent
  before_action :get_comment, except: [ :index, :create ]

  def index
    comments = Comment.includes(:user)

    render json: comments
  end

  def show
    render json: @comment
  end

  def create
    if comment = @parent.comments.create( comment_params )
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update_attributes( comment_params )
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    head @comment.destroy ? :no_content : :internal_server_error
  end

  private

  def get_parent
    head :bad_request unless @parent = if params[:article_id]
      Article.find( params[:article_id] )
    elsif params[:comment_id]
      Comment.find( params[:comment_id] )
    end
  end

  def get_comment
    head :not_found unless @comment = @parent.comments.find( params[:id] )
  end

  def comment_params
    params.require(:comment).permit( :body )
  end
end
