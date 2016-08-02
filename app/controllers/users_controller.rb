class UsersController < ApplicationController

  def create
    user = User.new(access_token: params[:access_token], first_name: params[:first_name], email: params[:email])
    if user.save
      render :json => { user_id: user.id }
    else
      render :status => :not_modified
    end
  end

  def show

  end

  def update

  end

end
