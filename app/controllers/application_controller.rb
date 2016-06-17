class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #this is for ajax to populate furniture types based off room selection
  respond_to :html, :xml, :json, :js
end
