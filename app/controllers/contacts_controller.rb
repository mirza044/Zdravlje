class ContactsController < ApplicationController

def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      flash.now[:notice] = 'Uspješno ste poslali poruku!'
    else
      flash.now[:error] = 'Nije moguće poslati poruku.'
      render :new
    end
  end

end
