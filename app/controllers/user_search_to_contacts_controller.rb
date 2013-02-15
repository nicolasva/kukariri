class UserSearchToContactsController < ApplicationController
  respond_to :json

  def index
    @contacts = Contact.includes(:user=>:friends).where("contacts.email = :email and friends_users.user_id is null", {:email => current_user.email})

    respond_with(@contacts) do |format|
      format.json {render json: @contacts.to_json(:include => :user)}
    end
  end
end
