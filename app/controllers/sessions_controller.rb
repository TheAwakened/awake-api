# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:session][:username])
    if user&.authenticate(params[:session][:password])
      login(user)
      redirect_to user, notice: 'Sign in successfully'
    else
      flash.now[:alert] = 'Invalid Username/Password'
      render 'new'
    end
  end

  def new; end

  def destroy
    logout
    redirect_to root_url, notice: 'Sign out successfully'
  end
end

