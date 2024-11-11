class Api::V1::ApiKeysController < Api::ApiController
  skip_before_action :authenticate_user, :authorize_request

  def create
    # Used just for testing purposes and should be rewritten once subscription plans implemented
    api_key = ApiKey.create_default_api_key

    render json: { value: api_key }
  end
end
