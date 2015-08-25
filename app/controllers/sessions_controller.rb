class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user && User.authenticate(@user.email, user_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render "new"
    end
  end

  def destroy
    session.clear
    redirect_to :root
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :position)
    end

end
