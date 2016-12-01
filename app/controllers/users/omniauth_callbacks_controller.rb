class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end
  # def google_oauth2
  #   @email = request.env['omniauth.auth']['info']['email']
  #   @user = User.from_omniauth(request.env['omniauth.auth'])
  #   if @user.persisted?
  #     sign_in(@user)
  #     redirect_to root_path
  #   else
  #     @userdata = { 
  #       provider:  request.env['omniauth.auth']['provider'],
  #       uid: request.env['omniauth.auth']['uid'],
  #       full_name: request.env['omniauth.auth']['info']['full_name'], 
  #       birthday: request.env['omniauth.auth']['info']['birthday'],
  #       avatar: request.env['omniauth.auth']['info']['image']
  #      }
  #         redirect_to new_user_registration_path(email: @email, userdata: @userdata)      
  #   end
  #      # $2a$11$b4QQfM6t81vc99KenIB3TOhENLMdZv.NxfnrO2NSnswAqpCy9UZGS
       
  # end

  def google_oauth2
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
      # respond_to do |format|
      #   if @user.send_reset_password_instructions
      #     format.html { redirect_to new_user_session_path, notice: 'langkah terakhir, cek email untuk konfirmasi pendaftaran' }
      #   else
      #     format.html { redirect_to new_user_session_path, error: 'sign in dengan akun google gagal' }
      #   end
      # end
    end


  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
