class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

   
    #@users = User.find_by(user_id: params[:user_id])

    

    
      
    

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def user_params
      params.require(:users).permit(@user.id)
    end

    def after_sign_in_path_for(resource)
      case resource
      when HostUser
        host_user_path(@host_user)
      when User
        user_path(@user)
      end
    end
    
end
