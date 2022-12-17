class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

private

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admin_root_path
    else
        root_path
    end
  end

  def
  after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :public
          root_path
      elsif resource_or_scope == :admin
          new_admin_session_path
      else
          root_path
      end
  end



  def current_cart_item

    current_cart_item = CartItem.find_by(id: session[:cart_item_id])
    current_cart_item = Cart.create unless current_cart_item
    session[:cart_item_id] = current_cart_item.id
    current_cart_item
  end

end
