class ContactsController < ApplicationController
  respond_to :html, :json
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = User.find_by_login(params[:login_id]).contacts
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

    respond_with(@contact)
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])

    respond_with(@contact)
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = User.find_by_login(params[:login_id]).contacts.new(:lastname => params[:contact][:lastname], :firstname => params[:contact][:firstname], :email => params[:contact][:email], :tel_home => params[:contact][:tel_home], :tel_mobil => params[:contact][:tel_mobil], :adress => params[:contact][:adress], :country => params[:contact][:country])

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
