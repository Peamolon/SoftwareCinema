class WelcomeController < ApplicationController
  before_action :set_current_path
  def index
    @current_user = current_user
  end

  protected
  def set_current_path
    unless @current_user.has_completed_signed?
      redirect_to new_employee_path, alert: "You need to complete the registration"
    end
  end
end
