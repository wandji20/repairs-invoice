class InvoicesController < ApplicationController
  before_action :verify_admin, except: :index

  def index
    @invoices = Invoice.includes(:invoice_items)
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      flash.now[:notice] = 'Invoice successfully crreated'
      redirect_to root_path
    else
      respond_to do |format|
        # flash[:alert] = 'Something went wrong'
        format.turbo_stream { render turbo_stream: turbo_stream.update('form-errors', partial: 'shared/error_messages', locals: { resource: @invoice}) }
        format.html { render :new }
      end
    end
  end

  def new
    @invoice = Invoice.new
  end

  private

  def invoice_params
    params.require(:invoice).permit(:user_id, :name, :email, invoice_items_attributes: [ :_destroy, :id, :part_id, :quantity])
  end

  def verify_admin
    redirect_to new_session_path unless current_user.admin?
  end
end
