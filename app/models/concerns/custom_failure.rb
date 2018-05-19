class CustomFailure < Devise::FailureApp
    def redirect_url
      "http://localhost:3000/users/sign_up"
    end
  
    def respond
      if http_auth?
        http_auth
      else
        redirect
      end
    end
  end