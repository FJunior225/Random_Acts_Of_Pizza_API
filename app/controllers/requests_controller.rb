class RequestsController < ApplicationController

  def index
    @requests = Request.all
    if @requests.any?
      render :json => { requests: @requests, errorMessage: ' ' }
    else
      render :json => { errorMessage: 'No current requests.'}
    end
  end

  def create
    @user_id = User.find(request[:userID])
    request = Request.new(creator: @user_id, first_name: params[:first_name], title: params[:title], city: params[:city], state: params[:state], pizzas: params[:pizzas])
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
      render :json => { errorMessage: "Cannot donate at this time." }
    end
  end

end
