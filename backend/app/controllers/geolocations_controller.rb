class GeolocationsController < ApplicationController
  include HostUtils

  def create
    geolocation_service = GeolocationServiceManager.new
    host = params.dig(:data, :host)

    geolocation = geolocation_service.create_or_update(host)

    if geolocation
      render json: geolocation, status: :created
    else
      render json: { error: "Failed to save geolocation data" }, status: :unprocessable_entity
    end
  end

  def show
    host = format_host(@query_params['host'])
    return render json: { error: "Invalid or missing host" }, status: :bad_request if host.nil?

    geolocation = Geolocation.find_by(host: host)

    if geolocation
      render json: geolocation
    else
      render json: { error: "Geolocation not found" }, status: :not_found
    end
  end

  def destroy
    host = format_host(@query_params['host'])
    return render json: { error: "Invalid or missing host" }, status: :bad_request if host.nil?
    geolocation = Geolocation.find_by(host: host)

    if geolocation
      geolocation.destroy
      head :no_content
    else
      render json: { error: "Geolocation not found" }, status: :not_found
    end
  end
end
