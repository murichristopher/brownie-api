class ApplicationController < ActionController::API
  before_action :authenticate_user!
skip_before_action :authenticate_user!, if: -> { devise_controller? && action_name == 'passthru' }


  # Authenticate user using JWT
def authenticate_user!
  token = request.headers['Authorization']&.split(' ')&.last
  Rails.logger.debug "Received token: #{token}"

  payload = decode_token(token)
  Rails.logger.debug "Decoded payload: #{payload}"

  @current_user = User.find(payload['id'])
rescue JWT::DecodeError, ActiveRecord::RecordNotFound => e
  Rails.logger.debug "Authentication failed: #{e.message}"
  render json: { errors: 'Unauthorized' }, status: :unauthorized
end

def decode_token(token)
  JWT.decode(token, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' }).first
rescue JWT::ExpiredSignature
  raise JWT::DecodeError, 'Token has expired'
end

  def current_user
    @current_user
  end
end
