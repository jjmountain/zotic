# frozen_string_literal: true

class Teachers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Accessible

  def google_oauth2
    teacher = Teacher.from_google(from_google_params)

    if teacher.present?
      sign_out_all_scopes
      flash[:notice] = t "devise.omniauth_callbacks.success", kind: "Google"
      sign_in_and_redirect teacher, event: :authentication
    else
      flash[:alert] = t "devise.omniauth_callbacks.failure",
        kind: "Google",
        reason: "#{auth.info.email} is not authorized."
      redirect_to new_teacher_session_path
    end
  end

  def from_google_params
    puts auth
    @from_google_params ||= {
      uid: auth.uid,
      email: auth.info.email,
      local: auth&.locale,
      name: auth.info&.name,
      first_name: auth.info&.first_name,
      last_name: auth.info&.last_name,
      image: auth.info&.image,
    }
  end

  def auth
    @auth ||= request.env["omniauth.auth"]
  end

  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /teachers/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
