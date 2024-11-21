Doorkeeper.configure do
  orm :active_record

  resource_owner_authenticator do
    current_user || warden.authenticate!(scope: :user)
  end

  resource_owner_from_credentials do |_routes|
    user = User.find_for_database_authentication(email: params[:username])
    if user&.valid_password?(params[:password])
      user
    end
  end
end
