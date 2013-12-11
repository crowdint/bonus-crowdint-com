CrowdintAuth::OmniauthCallbacksController.class_eval do
  def google_apps
    auth_hash = request.env['omniauth.auth']
    email = auth_hash.info['email']

    user = user_class.find_by_email(email)
    user ||= create_user_record(email, auth_hash.info['name'])


    if user.persisted?
      InvitationsService.new(self).assign(user, session[:organization_id]) if session[:organization_id]
      sign_in_and_redirect user
    end
  end
end
