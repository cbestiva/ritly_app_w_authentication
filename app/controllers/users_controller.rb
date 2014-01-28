class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
    # Use code below if gem 'protected_attributes' (which is for rails 3) is not installed and
    # remove the attr_accessors in the user model 
    user = params.require(:user).permit(:name, :email, :password, :password_confirmation)

  	@user = User.new(user)
  	if @user.save
  		flash[:success] = "Welcome to Ritly!"
  		sign_in @user
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def update
  	@user = User.find(params[:id])
  	@user.update_attributes(params[:user])
  	render :show
  end

end
