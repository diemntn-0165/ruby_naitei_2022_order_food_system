class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t ".update_success"
      redirect_to @user
    else
      flash[:error] = t ".update_failed"
      render :edit
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t(".signup_success")
      redirect_to login_path
    else
      flash[:danger] = t(".signup_fail")
      render :new
    end
  end

  def show; end

  private

  def user_params
    params.require(:user)
          .permit(:name, :address, :phone_number,
                  :email, :password, :password_confirmation)
  end

end
