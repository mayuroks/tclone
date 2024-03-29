class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to tweets_path, notice: 'User Successfully Added'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Updated Successfully'
    else
      render action: 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    render text: "#{@user.username}\n#{@user.email}\n\nAwe yeah"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
