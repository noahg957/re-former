class UsersController < ApplicationController

  # GET /users
  # GET /users.json

  # GET /users/1
  # GET /users/1.json


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
def edit
  @user = User.find(params[:id])
end
  # POST /users
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end
  # POST /users.json
  def create
    #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
