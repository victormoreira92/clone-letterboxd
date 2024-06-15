class HomeController < ApplicationController
  before_action :require_login

  def index
  end

  private

  def require_login
    if logged_in?
      redirect_to dashboard_index_path
    end
  end
end
