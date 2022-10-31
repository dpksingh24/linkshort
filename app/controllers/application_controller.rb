class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

    def authentication
      #unless auth_token is not equal to the Secutiy key then it will show the error message in the console.
      unless params["auth_token"] == SECURITY_KEY
        render json: "invalid_auth_token"
      end
    end

    private

    def not_destroyed(e)
      render json: { errors; e.record.errors }, status: :unprocessable_entity
    end

end
