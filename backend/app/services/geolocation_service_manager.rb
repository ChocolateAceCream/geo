class GeolocationServiceManager
  include HostUtils

  def initialize(service: IpstackService.new)
    @service = service
  end

  def create_or_update(input)
    host = format_host(input)
    return nil if host.nil?
    puts "host: #{host}"
    geo_data = @service.fetch_geolocation(host)
    puts "geo_data: #{geo_data}"
    return nil if geo_data.nil?

    geo_data[:host] = host

    geolocation = Geolocation.where(host: geo_data[:host]).first

    if geolocation
      geolocation.assign_attributes(geo_data)
      if geolocation.save
        return geolocation
      else
        return nil
      end
    else
      # Create a new geolocation record
      Geolocation.create(geo_data)
    end
  end
end
