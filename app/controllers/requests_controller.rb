class RequestsController < ApplicationController

  def index
    @requests = Request.open_requests
    if @requests.any?
      render :json => { requests: @requests, errorMessage: ' ' }
    else
      render :json => { errorMessage: 'No current requests.'}
    end
  end

  def create
    @user_id = User.find(request[:userID])
    request = Request.new(creator: @user_id, first_name: params[:first_name], title: params[:title], pizzas: params[:pizzas], vendor: params[:vendor], video: params[:video])
    if Request.daily_request(@user_id)
      render :json => { errorMessage: "Stop being greedy." }
    elsif request.save!
      render :json => { errorMessage: "Request has been created." }
    else
      render :json => { errorMessage: "Request was not created." }
    end
  end

  def update
    @donor = User.find(params[:userID])
    @request = Request.find(params[:id])
    if @request.update(donor_id: @donor.id)
      render :json => { user: @request.creator }
    else
      render :json => { errorMessage: "Cannot donate at this time." }
    end
  end

end
