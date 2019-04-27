class Api::AdsController < Api::ApplicationController

  def create
    ad = Ad.new(ad_params)
    if ad.save
      render json: { id: ad.reload.id, state: ad.reload.state }
    else
      render json: ad.errors
    end
  end

  def update
    ad = Ad.find(params[:id])
    if ad.update_attributes(ad_params)
      render json: ad
    else
      render json: ad.errors
    end
  end

  def show
    ad = Ad.find(params[:id])
    render json: ad       
  end

  def verify
    ad = Ad.find(params[:ad_id])
    ad.verify(params[:verified])
    render json: ad    
  end

  def cancelled
    ad = Ad.find(params[:ad_id])
    ad.cancel
    render json: ad  
  end

  private

  def ad_params
    params.permit(:business_id, :publisher_id, :title, :description, :start_date, :end_date, :print_version_url)    
  end

end