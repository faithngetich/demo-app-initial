class ApplicationController < ActionController::Base
  include Clearance::Controller
  
  def url_after_denied_access_when_signed_out
    new_session_path
  end
 end
 