require 'pry'
class SessionController < ApplicationController


    def create
        
        @user = User.find_by(email: params[:user][:email])
        
        if @user && @user.authenticate(params[:user][:password])
            render json: {
                email: @user.email, 
                name: @user.name, 
                discipline: @user.discipline,
                id: @user.id
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


end
