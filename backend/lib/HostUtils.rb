module HostUtils
  extend self

  def format_host(input)
    ip = extract_ip(input)
    return ip unless ip.nil?

    hostname = extract_hostname(input)
    return hostname unless hostname.nil?

    nil
  end

  def extract_ip(host)
    # Attempt to parse the host as an IP address
    IPAddr.new(host).to_s rescue nil
  end

  def extract_hostname(host)
    # Extract the hostname if the host is a valid URL
    # # Add a scheme if it's missing
    host = "http://#{host}" unless host =~ /\A[A-Za-z][A-Za-z0-9+\-.]*:\/\//
    uri = URI.parse(host)
    uri.host || host if uri.scheme
  rescue URI::InvalidURIError
    nil
  end
end