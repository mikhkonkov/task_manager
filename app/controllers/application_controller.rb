class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Concerns::AuthManagment
  helper_method :sign_in?

  protect_from_forgery with: :exception
end
