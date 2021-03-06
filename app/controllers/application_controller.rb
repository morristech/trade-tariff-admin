class ApplicationController < ActionController::Base
  include Pundit
  include GDS::SSO::ControllerMethods

  protect_from_forgery

  prepend_before_action :authenticate_user!
  before_action :require_signin_permission!

  unless Rails.env.test?
    rescue_from Pundit::NotAuthorizedError do |e|
      # Layout and view comes from GDS::SSO::ControllerMethods
      render "authorisations/unauthorised", layout: "unauthorised", status: :forbidden, locals: { message: e.message }
    end
  end

  def current_page
    Integer(params[:page] || 1)
  end
end
