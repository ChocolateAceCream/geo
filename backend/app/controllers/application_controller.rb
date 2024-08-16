class ApplicationController < ActionController::API
  before_action :decode_json_params

  private

  def decode_json_params
    return unless params[:params].present?

    begin
      decoded_params = CGI.unescape(params[:params])
      @query_params = JSON.parse(decoded_params)
    rescue JSON::ParserError
      render json: { error: "Invalid query parameters" }, status: :bad_request and return
    end
  end
end
