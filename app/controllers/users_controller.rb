class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @message = params[:message] if params[:message]
    redirect_to root_path unless current_user
  end

  def signin
  end

  def signout
    session.delete :user_id
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
