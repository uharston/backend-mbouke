class WorkersController < ApplicationController

    def create
        binding.pry
        @worker = Worker.create(signup_params)
        if @worker.valid? 
            render json: {success: true}
        else 
            render json: {error: @worker.errors, success: false}
        end 
    end 

    private 

    def signup_params 
        params.require(:user).permit(:service, :country, :city, :first_name, :last_name, :business_name, :phone_number, :email, :password)
    end 
end
