class UsersController < ApplicationController
  def new
  	@title_page = "New user"
  	@user = User.new
  end

  def show
  	@title_page = "User"
  end

  def create
  	 @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
  	
  end

  def destroy

  end
end
