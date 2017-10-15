class RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def edit
  end
  
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :email, :description])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number, :email, :description])
  end
end
