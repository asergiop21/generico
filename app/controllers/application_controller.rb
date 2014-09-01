class ApplicationController < ActionController::Base
  protect_from_forgery
    rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access Denied!"
     redirect_to :back 
    end
  protected
    before_filter :set_locale
private
  def set_locale
		  I18n.locale = params[:locale] if params[:locale].present?
  end
    
    def default_url_options(options = {})
      {locale: I18n.locale}
    end
end
    
    
