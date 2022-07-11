class ApplicationController < ActionController::Base


  include ApplicationHelper

  private
  def check_access
    unless has_access
      flash[:alert] = "Доступ запрещен"
      redirect_to  root_url
    end
  end
end
