class IpstackService
  include GeolocationServiceInterface

  def initialize(api_key = ENV['IPSTACK_ACCESS_KEY'])
    @api_key = api_key
  end

  def fetch_geolocation(host)
    # Assuming HTTParty or some other HTTP client is used here
    response = HTTParty.get("http://api.ipstack.com/#{host}?access_key=#{@api_key}")
    puts "response: #{response}"
    if response.success? && response.parsed_response['success'] != false
      parse_response(response)
    else
      return nil
    end
  end

  private

  def parse_response(response)
    # Parse the response and map it to your application's data structure
    {
      ip: response['ip'],
      type: response['type'],
      continent_code: response['continent_code'],
      continent_name: response['continent_name'],
      country_code: response['country_code'],
      country_name: response['country_name'],
      region_code: response['region_code'],
      region_name: response['region_name'],
      city: response['city'],
      zip: response['zip'],
      latitude: response['latitude'],
      longitude: response['longitude'],
      msa: response['msa'],
      dma: response['dma'],
      radius: response['radius'],
      ip_routing_type: response['ip_routing_type'],
      connection_type: response['connection_type'],
      location: parse_location(response['location']),
    }
  end

  def parse_location(location_data)
    {
      geoname_id: location_data['geoname_id'],
      capital: location_data['capital'],
      country_flag: location_data['country_flag'],
      country_flag_emoji: location_data['country_flag_emoji'],
      country_flag_emoji_unicode: location_data['country_flag_emoji_unicode'],
      calling_code: location_data['calling_code'],
      is_eu: location_data['is_eu'],
    }
  end

  def parse_language(language_data)
    {
      code: language_data['code'],
      name: language_data['name'],
      native: language_data['native']
    }
  end

  # def handle_error(response)
  #   # Handle errors, perhaps raising a custom exception
  #   raise StandardError, "Failed to fetch geolocation: #{response['error']['info']}"
  # end
end
