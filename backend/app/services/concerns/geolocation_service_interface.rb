module GeolocationServiceInterface
  def fetch_geolocation(host)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end