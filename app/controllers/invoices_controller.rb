class InvoicesController < ApplicationController
  before_action :verify_admin, except: :index

  def index; end

  def create; end

  def new; end

  private

  def invoice_params
    params.require(:invoice).permit(:name, :email, invoice_attributes: [ :_destroy, :part_id])
  end

  def verify_admin
    redirect_to new_session_path unless current_user.admin?
  end
end
