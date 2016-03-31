class UsersController < ApplicationController
  def new
    @user = User.new
    binding.pry
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @user.roles << Role.find_by(name: "registered_user")
      redirect_to dashboard_path
    else
      flash.now[:error] = "Invalid Input"
      render :new
    end
  end

  def show
    if current_user.business_admin?
      redirect_to admin_dashboard_path
    else
      current_user
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to dashboard_path
    else
      flash.now[:error] = "Invalid input"
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
