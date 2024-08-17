require 'rails_helper'
require 'webmock/rspec'

RSpec.describe GeolocationsController, type: :controller do
  let!(:geolocation) { create(:geolocation) }
  before do
    # Stub the HTTP request to ipstack.com with the correct URL
    stub_request(:get, "http://api.ipstack.com/#{geolocation.ip}?access_key=#{ENV['IPSTACK_ACCESS_KEY']}")
      .with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        })
      .to_return(status: 200, body: geolocation.to_json, headers: {})
  end

  describe 'POST #create' do
    context 'with valid IP address' do
      let(:valid_params) { { data: { host: geolocation.ip } } }

      it 'creates a new geolocation' do
        expect {
          post :create, params: valid_params
        }.to change(Geolocation, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['host']).to eq(geolocation.ip)
      end
    end
  end

  describe 'GET #show' do
    context 'when the geolocation exists' do
      let(:show_params) { { host: geolocation.host } }

      it 'returns the geolocation' do
        get :show, params: { params: show_params.to_json }
        puts "response: #{response}"

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['ip']).to eq(geolocation.ip)
      end
    end

    context 'when the geolocation does not exist' do
      let(:non_existent_host) { 'non-existent-host.com' }
      let(:show_params) { { host: non_existent_host } }

      it 'returns a not found error' do
        get :show, params: { params: show_params.to_json }

        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['error']).to eq('Geolocation not found')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when the geolocation exists' do
      let(:destroy_params) { { host: geolocation.host } }

      it 'deletes the geolocation and returns no content' do
        # Ensure the geolocation exists before deletion
        geolocation

        expect {
          delete :destroy, params: { params: destroy_params.to_json }
        }.to change(Geolocation, :count).by(-1)

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when the geolocation does not exist' do
      let(:non_existent_host) { 'non-existent-host.com' }
      let(:destroy_params) { { params: { host: non_existent_host } } }

      it 'returns a not found error' do
        expect {
          delete :destroy, params: { params: destroy_params.to_json }
        }.not_to change(Geolocation, :count)

        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['error']).to eq('Geolocation not found')
      end
    end

    context 'when the host parameter is invalid' do
      let(:invalid_host) { 'invalid-host' }
      let(:destroy_params) { { params: { host: invalid_host } } }

      before do
        allow_any_instance_of(GeolocationsController).to receive(:format_host).and_return(nil)
      end

      it 'returns a bad request error' do
        delete :destroy, params: { params: destroy_params.to_json }

        expect(response).to have_http_status(:bad_request)
        expect(JSON.parse(response.body)['error']).to eq('Invalid or missing host')
      end
    end
  end
end
