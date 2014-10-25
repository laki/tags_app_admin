class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery except: :null_session

  # skip_before_action :verify_authenticity_token, if: :json_request?

  # protected

  # def json_request?
  #   binding.pry
  #   request.format.json?
  # end
end
