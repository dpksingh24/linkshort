class ApplicationController < ActionController::Base

    def authentication
      #unless auth_token is not equal to the Secutiy key then it will show the error message in the console.
      unless params["auth_token"] == SECURITY_KEY
        render json: "invalid_auth_token"
      end
    end

end
