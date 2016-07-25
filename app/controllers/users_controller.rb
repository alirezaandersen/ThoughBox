class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save && params[:password] == params[:password_confirmation]
      session[:user_id] = @user.id
      flash[:success] = "You have successfully registered #{@user.email}"
      redirect_to links_path
    else
      flash.now[:alert] = "Invalid email and/or password combination"
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
