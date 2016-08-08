class UsersController < ApplicationController

  def show
    @user = User.find(request[:id])
    render :json => { email: @user.email }
  end

  def create
    email = request[:userInfo][:email]
    fb_userID = request[:userInfo][:id]
    first_name = request[:userInfo][:first_name]
    @user = User.find_by(fb_userID: fb_userID)
    if @user
      session[:user_id] = @user.id
      render :json => @user
    else
      @user = User.create(fb_userID: fb_userID, first_name: first_name, email: email)
      session[:user_id] = @user.id
      render :json => @user
    end
  end

  def update
    @user = User.find(request[:id])
    if @user.update(email: params[:updatedEmail])
      render :json => { email: @user.email }
    else
      render :json => { errorMessage: "Please enter valid email address." }
    end
  end

end
