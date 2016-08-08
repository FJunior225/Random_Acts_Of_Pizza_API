class RequestsController < ApplicationController

  def index
    @requests = Request.all
    render :json => { requests: @requests }
  end

  def show
    @request = Request.first
    if @request
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
    else
      render :json => { errorMessage: "No requests" }
    end
  end

  def create
    @user_id = User.find(request[:userID])
    request = Request.new(creator: @user_id, title: params[:title], city: params[:city], state: params[:state], pizzas: params[:pizzas])
    if request.save
      render :json => { errorMessage: "Request has been created." }
    else
      render :json => { errorMessage: "Request was not created." }
    end
  end

  def update
    @request = Request.find(request[:requestID])
    if @request.update(donor_id: request[:userID])
      render :json => { user: @request.creator }
    else
      render :json => { status: "fail" }
    end
  end

end
