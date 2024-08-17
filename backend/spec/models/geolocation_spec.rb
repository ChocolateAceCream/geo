# spec/models/geolocation_spec.rb

require 'rails_helper'

RSpec.describe Geolocation, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  # Test for fields
  it { is_expected.to have_field(:ip).of_type(String) }
  it { is_expected.to have_field(:host).of_type(String) }
  it { is_expected.to have_field(:type).of_type(String) }
  it { is_expected.to have_field(:continent_code).of_type(String) }
  it { is_expected.to have_field(:continent_name).of_type(String) }
  it { is_expected.to have_field(:country_code).of_type(String) }
  it { is_expected.to have_field(:country_name).of_type(String) }
  it { is_expected.to have_field(:region_code).of_type(String) }
  it { is_expected.to have_field(:region_name).of_type(String) }
  it { is_expected.to have_field(:city).of_type(String) }
  it { is_expected.to have_field(:zip).of_type(String) }
  it { is_expected.to have_field(:latitude).of_type(Float) }
  it { is_expected.to have_field(:longitude).of_type(Float) }

  # Test for embedded documents
  it { is_expected.to embed_one(:location) }

  # Test for indexes
  it { is_expected.to have_index_for(host: 1).with_options(unique: true) }
end
