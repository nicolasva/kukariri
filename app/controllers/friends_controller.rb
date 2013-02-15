class FriendsController < ApplicationController
  respond_to :json

  def index
    @friends = Friend.where(:user_id => current_user.id)

    respond_with(@friends)
  end

  def create
    @friend = Friend.new(:follow => params[:friend][:follow], :friend => params[:friend][:friend], :accept_friend => params[:friend][:accept_friend], :cancel => params[:friend][:cancel], :user_ids => params[:friend][:user_ids], :user_id => current_user.id)
    respond_with(@friend) do |format|
      if @friend.save
        format.json {render json: @friend}
      else
        format.json {render json: @friend.errors, status: :unprocessable_entity}
      end
    end
  end
end
