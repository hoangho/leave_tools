class UsersController < ApplicationController
  def new
  	@title_page = "New user"
  	@user = User.new
  end

  def show
  	@title_page = "User"
    @user = User.find(params[:id])
  end

  def create
  	 @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      sign_in @user #sign in first to remember token
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def update
  	
  end

  def destroy

  end
end
