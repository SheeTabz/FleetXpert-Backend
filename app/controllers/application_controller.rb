class ApplicationController < ActionController::API
    include ActionController::Cookies

    def encode_token(payload)
        payload[:iat] = Time.now.to_i
        JWT.encode(payload,'secret')
    end

    def decode_token
        auth_header=request.headers['Authorization']
        if auth_header
            token=auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'secret',true, algorithm:'HS256')
            rescue JWT::DecodeError
                nil

            end
        end
    end

    def authorized_user
        token = request.headers['Authorization'].split(' ').last if request.headers['Authorization']
        if TokenBlacklist.exists?(token: token)
          render json: { error: 'Not authorized' }, status: :unauthorized
        else
            decode_token=decode_token()
            if decode_token
                user_id=decode_token[0]['user_id']
                @user=User.find_by(id: user_id)
                render json: @user, status: :ok

            else
                render json: { error: 'Not authorized' }, status: :unauthorized
            end
        end
       
    end     
   
end
