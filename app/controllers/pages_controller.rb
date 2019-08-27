class PagesController < ApplicationController
  def home
    @user = User.new
    @session = session[:user_id]
  end

  def signed

  end
end
