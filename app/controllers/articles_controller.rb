class ArticlesController < ApplicationController
  before_action :get_article, except: [ :index, :create ]

  def index
    articles = Article.includes(:comments, :user)

    render json: articles
  end

  def show
    render json: @article
  end

  def create
    if article = Article.create( article_params )
      render json: article, status: :created
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update_attributes( article_params )
      head :no_content
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    head @article.destroy ? :no_content : :internal_server_error
  end

  private

  def get_article
    head :not_found unless @article = Article.find( params[:id] )
  end

  def article_params
    params.require(:article).permit( :title, :body )
  end
end
