class UserPhysicalInformationsController < ApplicationController

  def new
    @user_info = UserPhysicalInformation.new
  end

  def create
    @user_info = UserPhysicalInformation.new(user_info_params)
    if @user_info.save
      redirect_to daily_records_path, notice: "必要エネルギー量を設定しました" 
    else
      render :new
    end
  end

  def show
    @user_info = UserPhysicalInformation.find(current_user.id)
  end

  def edit
  end

  def update
  end

  private

  def user_info_params
    params.require(:user_physical_information).permit(:name, :metabolism, :user_id, :image )
  end

end
