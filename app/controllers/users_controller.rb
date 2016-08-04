class UsersController < ApplicationController

  def show
    @user = User.find(1)
    render :json => { user: @user }
  end

  def create
    user = User.new(access_token: params[:access_token], first_name: params[:first_name], email: params[:email])
    if user.save
      render :json => { user_id: user.id }
    else
      render :status => :not_modified
    end
  end

  def update
    puts request
    @user = User.find(1)
    if @user.update(email: "noah@googs.com")
      render :json => { user: @user }
    else
      render :json => { status: "fail" }
    end
  end

end
