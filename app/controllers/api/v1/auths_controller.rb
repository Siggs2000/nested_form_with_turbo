# module API
    # module V1
      class Api::V1::AuthsController < Api::V1::TurboApplicationController
        skip_before_action :authenticate_token!, only: [:create]
  
        def create
            if (user = User.valid_credentials?(params[:email], params[:password]))
                user.remember_me = true
                p "HERE IS THE USER: #{user.email}"
                sign_in user
                p "HERE IS THE TOKEN: #{user.authentication_token}"
                render json: {token: user.authentication_token}
            else
                render json: {error: error_message}, status: :unauthorized
            end
        end
  
        def destroy
          destroy_notification_token
          sign_out(current_user)
          render json: {}
        end
  
        private
  
        def error_message
          I18n.t("devise.failure.invalid", authentication_keys: :email)
        end
  
        def destroy_notification_token
          current_user.notification_tokens.where(token: params[:token]).destroy_all
        end
      end
    # end
# end
  