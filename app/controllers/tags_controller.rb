class TagsController < ApplicationController
  before_action :get_tag, except: [ :index, :create ]

  def index
    tags = Tag.all

    render json: tags
  end

  def show
    render json: @tag
  end

  def create
    if tag = Tag.create( tag_params )
      render json: tag, status: :created
    else
      render json: tag.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tag.update_attributes( tag_params )
      head :no_content
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    head @tag.destroy ? :no_content : :internal_server_error
  end

  private

  def get_tag
    head :not_found unless @tag = Tag.find( params[:id] )
  end

  def tag_params
    params.require(:tag).permit( :name )
  end
end
