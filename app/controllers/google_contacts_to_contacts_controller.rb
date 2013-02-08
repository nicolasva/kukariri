class GoogleContactsToContactsController < ApplicationController
  respond_to :json

  def create
    @google_contacts_to_contact = GoogleContactsToContact.find(params[:google_contacts_to_contact][:email], params[:google_contacts_to_contact][:password])
    respond_with(@google_contacts_to_contact) do |format|
      format.json {render json: @google_contacts_to_contact, status: :created}
    end
  end
end
