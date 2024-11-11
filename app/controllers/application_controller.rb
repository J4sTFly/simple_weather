class ApplicationController < ActionController::API
  def render_401(message = I18n.t("api.errors.401.default_message"))
    render json: { "#{I18n.t('api.api_error')}" => message }, status: :unauthorized
  end

  def render_403(message = I18n.t("api.errors.403.default_message"))
    render json: { "#{I18n.t('api.api_error')}" => message }, status: :forbidden
  end
end
