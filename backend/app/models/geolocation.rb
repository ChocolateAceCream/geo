class Geolocation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :ip, type: String
  field :hostname, type: String
  field :type, type: String
  field :continent_code, type: String
  field :continent_name, type: String
  field :country_code, type: String
  field :country_name, type: String
  field :region_code, type: String
  field :region_name, type: String
  field :city, type: String
  field :zip, type: String
  field :latitude, type: Float
  field :longitude, type: Float

  embeds_one :location
  embeds_one :time_zone

  index({ ip: 1 }, { unique: true })   # Index to ensure unique IP addresses
  index({ hostname: 1 }, { unique: true, sparse: true }) # Sparse index for hostname, if present
end


class Location
  include Mongoid::Document

  field :geoname_id, type: Integer
  field :capital, type: String
  field :country_flag, type: String
  field :country_flag_emoji, type: String
  field :country_flag_emoji_unicode, type: String
  field :calling_code, type: String
  field :is_eu, type: Boolean

  embeds_many :languages
  embedded_in :geolocation
end

class Language
  include Mongoid::Document

  field :code, type: String
  field :name, type: String
  field :native, type: String

  embedded_in :location
end

class TimeZone
  include Mongoid::Document

  field :id, type: String
  field :current_time, type: DateTime
  field :gmt_offset, type: Integer
  field :code, type: String
  field :is_daylight_saving, type: Boolean

  embedded_in :geolocation
end