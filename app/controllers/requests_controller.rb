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
    @user = User.find(2)
    request = Request.new(creator: @user, title: params[:title], city: params[:city], state: params[:state], pizzas: params[:pizzas])
    if request.save
      render :json => { errorMessage: "Request has been created." }
    else
      render :json => { errorMessage: "Request was not created." }
    end
  end

  def update
    @request = Request.find(1)
    p "fetch recieved"
    if @request.update(donor_id: 2)
      render :json => { user: @user }
    else
      render :json => { status: "fail" }
    end
  end

end
