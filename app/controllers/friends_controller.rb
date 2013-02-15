class FriendsController < ApplicationController
  respond_to :json

  def index
    @friends = Friend.where(:user_id => current_user.id)

    respond_with(@friends)
  end

  def create
    @friend = Friend.new(:follow => params[:friend][:follow], :friend => params[:friend][:friend], :accept_friend => params[:friend][:accept_friend], :user_ids => params[:friend][:user_ids], :user_id => current_user.id)
    @friend.save
    respond_with(@friend) do |format|
        format.json {render json: @friend}
    end
  end
end
