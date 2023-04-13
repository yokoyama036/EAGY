class DailyRecordItemsController < ApplicationController
  before_action :set_daily_record_item, only: [:destroy]

  def update
    @daily_record_item = DailyRecordItem.find(params[:id])
    if @daily_record_item.update(amount: params[:amount])
      redirect_to daily_record_path(@daily_record_item.daily_record), notice: '分量が更新されました。'
    else
      redirect_to daily_record_path(@daily_record_item.daily_record), alert: '分量の更新に失敗しました。'
    end
  end

  def destroy
    daily_record = @daily_record_item.daily_record
    @daily_record_item.destroy
    redirect_to daily_record_path(daily_record), notice: '項目を削除しました。'
  end

  private

  def set_daily_record_item
    @daily_record_item = DailyRecordItem.find(params[:id])
  end
end
