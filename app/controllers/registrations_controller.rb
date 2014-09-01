class RegistrationsController < Devise::RegistrationsController
#before_filter :authenticate_user!, :except => [:some_action_without_auth]

# GET /resource/sign_up

def new
	super
end

  # POST /resource
  def create
@user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."
      redirect_to root_url
    else
      render :action => :new
    end
end
 # GET /resource/edit
#  def edit
#      @registrations = User.find(params[:id])
#render  :action=> :edit
#  end

  # PUT /resource
#  def update
#    if resource.update_with_password(params[resource_name])
#      set_flash_message :notice, :updated
#      redirect_to after_update_path_for(resource)
#    else
#      clean_up_passwords(resource)
#      render_with_scope :edit
#    end
#  end

  # DELETE /resource
#  def destroy
#    resource.destroy
#    set_flash_message :notice, :destroyed
#    sign_out_and_redirect(self.resource)
#  end

# protected

    # Authenticates the current scope and gets a copy of the current resource.
    # We need to use a copy because we don't want actions like update changing
    # the current user in place.
#    def authenticate_scope!
#      send(:"authenticate_#{resource_name}!")
#      self.resource = resource_class.find(send(:"current_#{resource_name}").id)
#    end
end

