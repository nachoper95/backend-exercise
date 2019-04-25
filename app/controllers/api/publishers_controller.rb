class Api::PublishersController < Api::ApplicationController
  
  def create
    publisher = Publisher.new(publisher_params)
    if publisher.save
      render json: { id: publisher.reload.id }
    else
      render json: publisher.errors
    end
  end

  def update
    publisher = Publisher.find(params[:id])
    if publisher.update_attributes(publisher_params)
      render json: publisher
    else
      render json: publisher.errors
    end
  end

  def show
    publisher = Publisher.find(params[:id])
    render json: publisher       
  end

  def destroy
    publisher = Publisher.find(params[:id])
    publisher.destroy
    render status: 200, json: {}
  end
  
  private

  def publisher_params
    params.permit(:name, :description, :adPrice, :currency, :address, :phone)
  end

end    