class ApplicationController < ActionController::Base
  include Authentication
  allow_browser versions: :modern

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: Current.session.user_id)
  end
end
