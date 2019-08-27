class UsersController < ApplicationController
    
    def index
        render plain: "I am an index action."
    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    
    end

    def show
        user = User.find(params[:id])
        debugger
        render json: user
    end
 
end

