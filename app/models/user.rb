class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  def generate_jwt
    JWT.encode(
      { id: id, exp: 24.hours.from_now.to_i }, # Payload
      Rails.application.credentials.secret_key_base, # Signing Key
      'HS256' # Algorithm
    )
  end


  # Optional validations
  validates :provider, presence: true, if: -> { uid.present? }
  validates :uid, presence: true, if: -> { provider.present? }
end
