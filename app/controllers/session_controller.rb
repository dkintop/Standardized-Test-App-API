require 'pry'
class SessionController < ApplicationController


    def create
        
        @user = User.find_by(email: session_params[:email])
        
        if @user && @user.authenticate(session_params[:password])
            
            token = JWT.encode({
                email: @user.email,
                name: @user.name,
                discipline: @user.discipline,
                id: @user.id,
                }, ENV["JWT_SECRET"])
            
            
            render json: {
                email: @user.email, 
                name: @user.name, 
                discipline: @user.discipline,
                id: @user.id,
                token: token
            } 
        else
            render json:{
                error: "User not Found",
                details: @user.errors.full_messages
            }, status: :unauthorized
        end
    end

    def delete

    end

    private
     def session_params
      params.require(:user).permit(:email, :password)
    end

end
