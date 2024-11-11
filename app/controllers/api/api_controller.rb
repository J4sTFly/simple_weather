class Api::ApiController < ApplicationController
  before_action :authenticate_user, :authorize_request

  private

  def authenticate_user
    render_401 unless api_key
  end

  def api_key
    @api_key ||= ApiKey.active.find_by(api_version: params[:api_version], value: params[:key])
  end

  def authorize_request
    render_403 unless api_key.permissions.find_by(api_version: params[:api_version],
                                                  controller: params[:controller],
                                                  action: params[:action])
  end
end
