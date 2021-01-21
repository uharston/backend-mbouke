class SessionsController < ApplicationController

    def login 
        @worker = Worker.find_by(email: signup_params[:email])
        if @worker && @worker.authenticate(signup_params[:password]) 
            token = JWT.encode(payload, 'secret')
            render json: {success: true, jwt: token }
        end 
        render json: {success: false, errors: "Authentication Failed :("}
    end 

    private 

    def signup_params 
        params.require(:user).permit(:email, :password)
    end 

end
