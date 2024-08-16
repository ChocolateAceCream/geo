class GeolocationsController < ApplicationController
  def create
    geolocation_service = IpstackService.new()
    geo_data = geolocation_service.fetch_geolocation(params[:ip_address])

    geolocation = Geolocation.new(geo_data)

    if geolocation.save
      render json: geolocation, status: :created
    else
      render json: geolocation.errors, status: :unprocessable_entity
    end
  end

  def show
    geolocation = Geolocation.find_by(ip: params[:id]) || Geolocation.find_by(hostname: params[:id])

    if geolocation
      render json: geolocation
    else
      render json: { error: "Geolocation not found" }, status: :not_found
    end
  end

  def destroy
    geolocation = Geolocation.find_by(ip: params[:id]) || Geolocation.find_by(hostname: params[:id])

    if geolocation
      geolocation.destroy
      head :no_content
    else
      render json: { error: "Geolocation not found" }, status: :not_found
    end
  end
end
