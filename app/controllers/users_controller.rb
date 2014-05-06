class UsersController < ApplicationController
  before_action :get_user, except: [ :index, :create ]

  def index
    users = User.all

    render json: users
  end

  def show
    render json: @user
  end

  def create
    if user = User.create( user_params )
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update_attributes( user_params )
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    head @user.destroy ? :no_content : :internal_server_error
  end

  private

  def get_user
    head :not_found unless @user = User.find( params[:id] )
  end

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation
    )
  end
end
