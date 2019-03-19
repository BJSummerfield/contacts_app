class Api::ContactsController < ApplicationController
  before_action :authenticate_user
  def index
    if current_user
      @contacts = current_user.contact
      render 'index.json.jbuilder'
    else 
      render json: []
    end
  end

  def show
    the_id = params[:id]
    @contact = Contact.find_by(id: the_id)
    render 'show.json.jbuilder'
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      middle_name: params[:middle_name],
      bio: params[:bio],
      email: params[:email],
      phone_number: params[:phone_number]
      )
    if @contact.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :uprocessible_entity
    end
  end

  def update
    the_id = params[:id]
    @contact = Contact.find_by(id: the_id)
    if @contact.update(
      first_name: params[:first_name] || @contact.first_name,
      last_name: params[:last_name] || @contact.last_name,
      middle_name: params[:middle_name] || @contact.middle_name,
      bio: params[:bio] || @contact.bio,
      email: params[:email] || @contact.email,
      phone_number: params[:phone_number] || @contact.phone_number)
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :uprocessible_entity
    end
  end

  def destroy
    the_id = params[:id]
    @contact = Contact.find_by(id: the_id)
    @contact.destroy
    render 'destroy.json.jbuilder'
  end    
end
