require 'httparty'

class IpstackService < GeolocationService
  include HTTParty
  base_uri 'http://api.ipstack.com'

  def initialize
    @access_key = ENV['IPSTACK_ACCESS_KEY']
  end

  def fetch_geolocation(ip_or_hostname)
    response = self.class.get("/#{ip_or_hostname}?access_key=#{@access_key}")

    if response.success?
      parsed_response = JSON.parse(response.body)
      format_response(parsed_response)
    else
      if response.body.empty?
        raise "Error fetching geolocation data: #{response.message || 'Unknown error'}"
      else
        parsed_response = JSON.parse(response.body)
        error_message = parsed_response['error'] || response.message || "Unknown error"
        raise "Error fetching geolocation data: #{error_message}"
      end
    end
  end

  private

  def format_response(response)
    {
      ip: response['ip'],
      hostname: response['hostname'],
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
      location: {
        geoname_id: response.dig('location', 'geoname_id'),
        capital: response.dig('location', 'capital'),
        country_flag: response.dig('location', 'country_flag'),
        country_flag_emoji: response.dig('location', 'country_flag_emoji'),
        country_flag_emoji_unicode: response.dig('location', 'country_flag_emoji_unicode'),
        calling_code: response.dig('location', 'calling_code'),
        is_eu: response.dig('location', 'is_eu')
      },
      time_zone: {
        id: response.dig('time_zone', 'id'),
        current_time: response.dig('time_zone', 'current_time'),
        gmt_offset: response.dig('time_zone', 'gmt_offset'),
        code: response.dig('time_zone', 'code'),
        is_daylight_saving: response.dig('time_zone', 'is_daylight_saving')
      }
    }
  end
end
