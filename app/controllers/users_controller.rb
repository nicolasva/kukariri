class UsersController < ApplicationController
  respond_to :json
  def show
    @user = User.find_by_email(params[:email])

    respond_with(@user)
  end
end
