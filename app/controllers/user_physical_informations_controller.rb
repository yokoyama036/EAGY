class UserPhysicalInformationsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @user_info = UserPhysicalInformation.new
  end

  def create
    @user_info = UserPhysicalInformation.new(user_info_params)
    if @user_info.save
      redirect_to daily_records_path
      flash.now[:success] = "必要エネルギー量を設定しました" 
    else
      flash.now[:alert] = '必要情報が入力されていません。'
      render :new
    end
  end

  def show
    @user_info = current_user.user_physical_information
  end

  def edit
    @user_info = UserPhysicalInformation.find_by(user_id: current_user.id)
  end

  def update
    @user_info = UserPhysicalInformation.find_by(user_id: current_user.id)
    if @user_info.update(user_info_params)
      flash[:notice] = 'ユーザー情報が更新されました。'
      redirect_to user_physical_information_path(@user_info)
    else
      flash.now[:alert] = 'ユーザー情報の更新に失敗しました。'
      render :edit
    end
  end

  private

  def user_info_params
    params.require(:user_physical_information).permit(:name, :metabolism, :user_id, :image, :protein, :carbo, :fat, :salt, :id )
  end

  def ensure_correct_user
    user_physical_information = UserPhysicalInformation.find(params[:id])
    @user = user_physical_information.user_id
    unless @user == current_user.id
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end
end
