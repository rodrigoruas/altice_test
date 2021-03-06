class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user =User.new(user_params)
    if @user.save
      redirect_to signed_path
    else
      flash[:alert] = "Usuario Ja existe"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
