module Concerns
  module AuthManagment
    def sign_in(user)
      session[:user_id] = user.id
    end

    def sign_out
      session[:user_id] = nil
    end

    def sign_in?
      !current_user.nil?
    end

    def current_user
      @_current_user ||= User.where(id: session[:user_id]).first
    end
  end
end
