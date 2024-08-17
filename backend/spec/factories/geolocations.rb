FactoryBot.define do
  factory :geolocation do
    ip { "134.201.250.155" }
    host { "blog.easydelivery.ltd" }
    type { "ipv4" }
    continent_code { "NA" }
    continent_name { "North America" }
    country_code { "US" }
    country_name { "United States" }
    region_code { "CA" }
    region_name { "California" }
    city { "Los Angeles" }
    zip { "90012" }
    latitude { 34.0655517578125 }
    longitude { -118.24053955078125 }

    # Embed the location directly within the geolocation factory
    location do
      association :location, strategy: :build
    end
  end

  factory :location do
    geoname_id { 5368361 }
    capital { "Washington D.C." }
    country_flag { "https://assets.ipstack.com/flags/us.svg" }
    country_flag_emoji { "🇺🇸" }
    country_flag_emoji_unicode { "U+1F1FA U+1F1F8" }
    calling_code { "1" }
    is_eu { false }
  end
end