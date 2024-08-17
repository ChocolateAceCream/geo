require 'rails_helper'

RSpec.describe IpstackService, type: :service do
  let(:service) { IpstackService.new }
  let(:valid_ip) { '134.201.250.155' }
  let(:invalid_ip) { 'invalid_ip' }
  let(:sample_response) do
    {
      'ip' => valid_ip,
      'host' => valid_ip,
      'type' => 'ipv4',
      'continent_code' => 'NA',
      'continent_name' => 'North America',
      'country_code' => 'US',
      'country_name' => 'United States',
      'region_code' => 'CA',
      'region_name' => 'California',
      'city' => 'Los Angeles',
      'zip' => '90013',
      'latitude' => 34.0655,
      'longitude' => -118.2405,
      'location' => {
        'geoname_id' => 5368361,
        'capital' => 'Washington D.C.',
        'country_flag' => 'https://assets.ipstack.com/images/assets/flags_svg/us.svg',
        'country_flag_emoji' => '🇺🇸',
        'country_flag_emoji_unicode' => 'U+1F1FA U+1F1F8',
        'calling_code' => '1',
        'is_eu' => false
      },
    }.to_json
  end

  before do
    # Stub the request to IPStack API and return a sample response
    stub_request(:get, "http://api.ipstack.com/#{valid_ip}?access_key=#{ENV['IPSTACK_ACCESS_KEY']}")
      .to_return(status: 200, body: sample_response, headers: { 'Content-Type' => 'application/json' })

    stub_request(:get, "http://api.ipstack.com/#{invalid_ip}?access_key=#{ENV['IPSTACK_ACCESS_KEY']}")
      .to_return(status: 404, body: "", headers: { 'Content-Type' => 'application/json' })
  end

  it 'fetches geolocation data for a valid IP address' do
    result = service.fetch_geolocation(valid_ip)
    expect(result[:ip]).to eq(valid_ip)
    expect(result[:country_name]).to eq('United States')
    expect(result[:city]).to eq('Los Angeles')
  end

  it 'return nil when the IP is invalid' do
    result = service.fetch_geolocation(invalid_ip)
    expect(result).to be_nil
  end
end
