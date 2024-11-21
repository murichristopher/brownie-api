class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!, only: [:google_oauth2]

  def google_oauth2
    auth_data = request.env['omniauth.auth']

    user = User.find_or_initialize_by(provider: auth_data.provider, uid: auth_data.uid)
    user.assign_attributes(
      email: auth_data.info.email,
      name: auth_data.info.name,
      password: Devise.friendly_token[0, 20], # Only used for new users
      profile_picture: auth_data.info.image
    )

    if user.save
      token = user.generate_jwt
      render json: {
        token: token,
        user: {
          id: user.id,
          email: user.email,
          name: user.name,
          profile_picture: user.profile_picture
        }
      }
    else
      render json: { errors: "Authentication failed" }, status: :unauthorized
    end
  end
end
