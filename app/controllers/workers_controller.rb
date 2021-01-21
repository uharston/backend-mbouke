class WorkersController < ApplicationController


    def create
        @worker = Worker.create(signup_params)
        if @worker.valid? 
            payload = {worker_id: @worker.id}
            token = JWT.encode(payload, 'secret')
            render json: {success: true, jwt: token }
        else 

            render json: {success: false, errors: @worker.errors.full_messages }
        end 
    end 

    def show 
        decoded_hash = decode_token 
        if !decoded_hash.empty? 
            @worker = Worker.find(decoded_hash[0]['worker_id'])
            render json: {success: true, user: { email: @worker.email }}
        else 
            render json: {success: false}
        end
        # render json: {success: false}
    end 

    private 

    def signup_params 
        params.require(:user).permit(:service, :country, :city, :first_name, :last_name, :business_name, :phone_number, :email, :password)
    end 

    def decode_token 
        auth_token = request.headers['Authorization'].split(' ')[1]
        if auth_token
            begin
                JWT.decode(auth_token, 'secret', algorithm: 'HS256')
            rescue JWT::DecodeError
                []
            end
        end
    end

    # def auth_params 
    #     params.require(:user).permit(:jwt)
    # end 
end
