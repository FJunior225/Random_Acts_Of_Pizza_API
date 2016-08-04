class RequestsController < ApplicationController

  def index
    @requests = Request.all
    render :json => { requests: @requests }
  end

  def show
    @request = Request.first
    render :json => {
      request: {
        name: @request.creator.first_name,
        hours: 1,
        title: @request.title,
        city: @request.city,
        state: @request.state,
        pizzas: @request.pizzas
      }
    }
  end

  def create
    request = Request.new(creator_id: User.find_by(params[:access_token]), title: params[:title], video: params[:video], pizzas: params[:pizzas], status: params[:status])
    if round.save

    else
      render :status => :not_modified
    end
  end

end
