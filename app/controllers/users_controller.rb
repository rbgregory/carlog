class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def set_user
    @user = User.find_by slug: params[:id]
  end

end
