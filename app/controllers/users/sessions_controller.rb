class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in User.guest  
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
