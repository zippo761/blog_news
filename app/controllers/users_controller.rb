class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[destroy set_grants]

  # GET /users
  def index
    @users = User.all
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Пользователь удален.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
