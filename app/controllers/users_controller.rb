class UsersController < ApplicationController
  def index
    users = User.all

    render json: users.map { |user| 
      {
        id: user.id,
        name: user.name,
        email: user.email,
        coins: user.coins,
        profile_picture: user.profile_picture
      }
    }
  end

  def me
    my_user = current_user

    render json: {
      id: my_user.id,
      email: my_user.email,
      profile_picture: my_user.profile_picture,
      coins: my_user.coins
    }
  end
end
