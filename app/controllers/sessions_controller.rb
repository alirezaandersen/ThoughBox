class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome back, #{@user.email}"
      redirect_to links_path
    else
      flash[:error] = "Invalid email and/or password combination"
      render :new
    end
  end

  def destroy
  flash[:alert] = "You have successfully logged out #{current_user.email}"
  session.clear
  redirect_to root_path
end

end
