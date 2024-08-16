class GeolocationService
  def fetch_geolocation(ip_or_hostname)
    raise NotImplementedError, "This method should be overridden in a subclass"
  end
end