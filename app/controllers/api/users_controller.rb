class API::UsersController < API::ApplicationController
  before_action :authenticate_user, only: [:update, :destroy]

  def create
    @user = User.new(user_params)
    if @user.save
      render json:{ message: 'You have succesfully registered.' }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: 422
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: 422
    end
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
