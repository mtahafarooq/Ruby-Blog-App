class Users::SessionsController < Devise::SessionsController

   
   before_action :configure_sign_in_params, only: [:create]

  GET /resource/sign_in
   def new
     super 
   end

   POST /resource/sign_in
   def create
     super 
   

   DELETE /resource/sign_out
   def destroy
     super
   end

   #protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  devise_for :users, controllers: { sessions: 'users/sessions' }
  def create
    super do |resource|
      BackgroundWorker.trigger(resource)
       def current_user
     @current_user ||= User.find_by(id: session[:user_id])
  end
    end
    
  <h2>Log in</h2>

<%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>
  <div class="field">
    <%= f.label :email %><br />
    <%= f.email_field :email, autofocus: true %>
  </div>

  <div class="field">
    <%= f.label :password %><br />
    <%= f.password_field :password, autocomplete: "off" %>
  </div>

  <% if devise_mapping.rememberable? -%>
    <div class="field">
      <%= f.check_box :remember_me %>
      <%= f.label :remember_me %>
    </div>
  <% end -%>

  <div class="actions">
    <%= f.submit "Log in" %>
  </div>
<% end %>

<%= render "devise/shared/links" %>
end
