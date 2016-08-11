class RequestsController < ApplicationController

  def index
    @pizzas = Request.totalPizzasDonated
    @requests = Request.open_requests
    if @requests.any?
      render :json => { totalDonatedPizzas: @pizzas, requests: @requests, errorMessage: ' ' }
    else
      render :json => { totalDonatedPizzas: @pizzas, errorMessage: 'No current requests.'}
    end
  end

  def create
    @user_id = User.find(request[:userID])
    request = Request.new(creator: @user_id, first_name: params[:first_name], title: params[:title], pizzas: params[:pizzas], vendor: params[:vendor], video: params[:video])
    if User.daily_request(@user_id)
      render :json => { errorMessage: "Stop being greedy." }
    elsif request.save!

      @requests = Request.open_requests
      render :json => { requests: @requests, errorMessage: "Request has been created." }
    else
      render :json => { errorMessage: "Request was not created." }
    end
  end

  def update
    @donor = User.find(params[:userID])
    @request = Request.find(params[:id])
    if @request.update(donor_id: @donor.id)
      @requests = Request.open_requests
      @pizzas = Request.totalPizzasDonated
      render :json => { totalDonatedPizzas: @pizzas, requests: @requests }
    else
      render :json => { errorMessage: "Cannot donate at this time." }
    end
  end

end
