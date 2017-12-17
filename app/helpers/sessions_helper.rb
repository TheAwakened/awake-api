# frozen_string_literal: true

module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    @login_user ||= User.find_by(id: session[:user_id])
  end

  def login?
    !current_user.nil?
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end
