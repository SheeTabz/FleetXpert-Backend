class SessionsController < ApplicationController

 def create 
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
     token=encode_token({user_id: @user.id})
   
      render json:{user:@user,token: token},status: :ok
   
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end

 end

 def destroy
  token = request.headers['Authorization'].split(' ').last if request.headers['Authorization']
  TokenBlacklist.create(token: token, expires_at: 1.hour.from_now) if token
  head :no_content
end


end