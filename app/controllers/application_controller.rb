class ApplicationController < ActionController::Base
  #noinspection RailsParamDefResolve
  before_action :authenticate_user!, unless: :devise_controller?

  private

    #noinspection RubyResolve
    def current_company
      @current_company ||= user_signed_in? && current_user.company
    end
    helper_method :current_company
end
