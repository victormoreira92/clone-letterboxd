class ApplicationController < ActionController::Base

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def after_sign_in_path_for(user)
    session[:user_id] = user.id
    dashboard_index_path
  end

  def after_sign_out_path_for(user)
    home_index_path
  end

  def logged_in?
    !!current_user
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end


end
