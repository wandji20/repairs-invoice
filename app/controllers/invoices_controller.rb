class InvoicesController < ApplicationController
  before_action :verify_admin, except: :index

  def index
  end

  def create
  end

  def new
  end

  private
  def verify_admin
    redirect_to new_session_path unless current_user.admin?
  end
end
