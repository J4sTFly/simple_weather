require 'rails_helper'

RSpec.describe "Api::V1::ApiKeysControllers", type: :request do
  describe "POST /create" do
    let!(:subscription_plan) { create :subscription_plan }
    it 'returns a successful response' do
      post api_v1_api_keys_path

      expect(response).to be_successful
    end

    it 'returns the new ApiKey value' do
      post api_v1_api_keys_path
      expect(response.body).to eq({ value: ApiKey.last.value }.to_json)
    end
  end
end
