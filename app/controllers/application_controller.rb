class ApplicationController < ActionController::Base
  require "openai"
  require 'dotenv'
  Dotenv.load
  before_action :authenticate_user!
  # before_action :check_user_physical_information
  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    daily_records_path  #ここを好きなパスに変更
  end


  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path #ここを好きなパスに変更
  end
  private

  def check_user_physical_information
    if user_signed_in? && current_user.user_physical_information.nil?
      redirect_to new_user_physical_information_path
    end
  end
end
