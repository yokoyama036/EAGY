class ApplicationController < ActionController::Base

  # ログイン後のリダイレクト先
  # def after_sign_in_path_for(resource_or_scope)
  #   root_path  #ここを好きなパスに変更
  # end

  ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path #ここを好きなパスに変更
  end

end
