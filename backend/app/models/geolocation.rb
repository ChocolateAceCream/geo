class Geolocation
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :ip, type: String
  field :host, type: String
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

  index({ host: 1 }, { unique: true})

  validates :host, uniqueness: { allow_blank: false }
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
