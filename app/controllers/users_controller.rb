class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user.id)
      flash[:notice] = 'Account successfully created'
      redirect_to root_path
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            'form-errors', partial: 'shared/error_messages', locals: { resource: @user }
          )
        end
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
