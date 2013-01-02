class ContactsController < ApplicationController
  respond_to :html, :json
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.where(:user_id => current_user.id)

    respond_with(@contacts)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])

    respond_with(@contact) do |format|
      format.json { render json: @contact.to_json(:include => :provided_date) }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @contact }
    #end
    respond_with(@contact)
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(params[:contact])

    respond_with(@contact) do |format|
      if @contact.save
        format.json {render json: @contact}
      else
        format.json {render json: @contact.errors, status: :unprocessable_entity}
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])

    respond_with(@contact) do |format|
      if @contact.update_attributes(params[:contact])
        format.json { render json: @contact.to_json(:include => :types) }
      else
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_with(@contact)
  end
end
