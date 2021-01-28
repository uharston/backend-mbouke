class SessionsController < ApplicationController

    def login 
        @worker = Worker.find_by(email: signup_params[:email])
        if @worker && @worker.authenticate(signup_params[:password]) 
            payload = {worker_id: @worker.id}
            token = JWT.encode(payload, 'secret')
            render json: {success: true, jwt: token }
        else
            render json: {success: false, errors: "Authentication Failed :("}
        end
    end 

    private 

    def signup_params 
        params.require(:user).permit(:email, :password)
    end 

end
