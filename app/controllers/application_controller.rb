class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  
    private

    def set_mailer_host
      subdomain = current_account ? "#{current_account.subdomain}." : ""
      ActionMailer::Base.default_url_options[:host] = "#{subdomain}lvh.me:3000"
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :role, :date_of_birth, :years_played) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password) }
      devise_parameter_sanitizer.for(:invite) { |u| u.permit :email, :role, :team_id }
    end
 
    # def after_invite_path_for(resource)
    #   users_path
    # end
end
