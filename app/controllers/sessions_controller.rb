class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new; end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user&.authenticate(session_params[:password])
      login(@user.id)
      flash[:notice] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash[:alert] = 'Invalid Credentials'
      render :new
    end
  end

  def destroy
    logout
    flash[:notice] = 'You have successfully logged out'
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
