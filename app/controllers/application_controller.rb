class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_user

  private

    def set_user
      if user_signed_in?
        @user = current_user
      else
        @user ||= Guest.find_by_token(session[:guest_token])
        unless @user
          @user = Guest.create!
          session[:guest_token] = @user.token
        end
      end   
    end

end
