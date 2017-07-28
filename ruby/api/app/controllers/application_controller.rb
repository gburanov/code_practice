class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include CanCan::ControllerAdditions

  load_and_authorize_resource
  before_action :authentificated_user

  rescue_from ActiveRecord::RecordNotFound do |exception|
    @errors = ["not found"]
    render status: :not_found, template: :error
  end

  rescue_from CanCan::AccessDenied do |exception|
    @errors = [exception.message]
    render status: :method_not_allowed, template: :error
  end

  def current_user
    @current_user ||= authentificated_user if request.env["HTTP_AUTHORIZATION"]
  end

  def authentificated_user
    authenticate_or_request_with_http_basic do |login, password|
      User.where(login: login, password: password).first
    end
  end

  def render_json_with_errors_for(object)
    @errors = object.errors
    render status: :bad_request, template: :error
  end
end
