class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    
   
    #@users = User.find_by(user_id: params[:user_id])
    def after_sign_in_path_for(resource)
      case resource
      when HostUser
        host_user_path(id: resource.id)
      when User
        user_path(id: resource.id)     
      end
    end
    #@user = User.find_by(params[:id])    
    

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :id])
    end

    def user_params
      params.require(:users).permit(user_id)
    end

    def host_user_params
      params.require(:host_users).permit(host_user_id)
    end
    

    

end
