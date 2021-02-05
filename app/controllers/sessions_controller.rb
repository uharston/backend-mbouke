class SessionsController < ApplicationController

    def login 
        @worker = Worker.find_by(email: signup_params[:email])
        if @worker && @worker.authenticate(signup_params[:password]) 
            payload = {worker_id: @worker.id}
            token = JWT.encode(payload, 'secret')
            render json: {success: true, user: {name: @worker.first_name, email: @worker.email}}
        else
            render json: {success: false, errors: "Authentication Failed :(", user: nil }
        end
    end 

    private 

    def signup_params 
        default_params = params.require(:user).permit(:email, :password)
        lowercase_email_params = default_params.dup 
        lowercase_email_params[:email] = default_params[:email].downcase
        return lowercase_email_params
    end 

end
