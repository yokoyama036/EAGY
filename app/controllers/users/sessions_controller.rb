class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in User.guest  
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  def guest_admin_sign_in
    user = User.guest_admin
    sign_in User.guest_admin
    redirect_to after_sign_in_path_for(user), notice: 'ゲスト管理者としてログインしました。'
  end
end
