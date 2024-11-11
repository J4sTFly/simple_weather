class ApplicationController < ActionController::API
  def render_404
    render json: error_response(I18n.t("api.errors.404.default_message")), status: :not_found
  end

  private

  def render_401(message = I18n.t("api.errors.401.default_message"))
    render json: error_response(message), status: :unauthorized
  end

  def render_403(message = I18n.t("api.errors.403.default_message"))
    render json: error_response(message), status: :forbidden
  end

  def error_response(message)
    { "#{I18n.t('api.api_error')}" => message }
  end
end
