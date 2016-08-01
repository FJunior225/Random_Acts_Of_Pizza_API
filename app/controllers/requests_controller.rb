class RequestsController < ApplicationController

  def create
    request = Request.new(creator_id: User.find_by(params[:access_token]), title: params[:title], video: params[:video], pizzas: params[:pizzas], status: params[:status])
    if round.save

    else
      render :status => :not_modified
    end
  end

  def show
    requests = Request.where(status: )
  end

end
