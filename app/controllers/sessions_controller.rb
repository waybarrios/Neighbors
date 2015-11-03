class SessionsController < Devise::SessionsController

 def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_in_and_redirect(resource_name, resource)

  end
 
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
     set_flash_message(:notice, :signed_in) if is_navigational_format? 
    sign_in(scope, resource)
    #return render :json => {:success => true}
    #format.html { redirect_to home_index_path, notice: 'Alert was successfully created.' }
    datos = resource

    respond_to do |format|
      #format.html # show.html.erb
      #format.json { render json: { titulo: titulo, datos: datos } }
      format.json { render json: resource }
    end
  end
 
  def failure
    return render :json => {:success => false, :errors => ["Login failed."]}
  end
end