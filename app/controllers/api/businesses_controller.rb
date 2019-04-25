class Api::BusinessesController < Api::ApplicationController
    
  def create
    business = Business.new(business_params)
    if business.save
      render json: { id: business.reload.id }
    else
      render json: business.errors
    end
  end

  def update
    business = Business.find(params[:id])
    if business.update_attributes(business_params)
      render json: business
    else
      render json: business.errors
    end
  end

  def show
    business = Business.find(params[:id])
    render json: business       
  end

  def destroy
    business = Business.find(params[:id])
    business.destroy
    render status: 200, json: {}
  end

    private

    def business_params
      params.permit(:name, :address, :city, :state, :country, :phone, :description, :site_url)
    end
  
  end    