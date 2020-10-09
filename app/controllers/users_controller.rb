class UsersController < ApplicationController
  before_action :set_user

  def index
    redirect_to root_path
  end

  def show
    @gifs = @user.gifs.sorted
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end