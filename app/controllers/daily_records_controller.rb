class DailyRecordsController < ApplicationController

  def index
    @daily_records = DailyRecord.all
  end
  
  def new
    @daily_record = DailyRecord.new(date: params[:date])
    @foods = Food.all
    @mysets = Myset.all
  end

  def create
    @daily_record = DailyRecord.new(food_id: params[:daily_record][:food_id], user_id: current_user.id)

    if @daily_record.save
      redirect_to @daily_record, notice: '記録しました。'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @record.update(event_params)
      redirect_to @record, notice: '記録を更新しました'
    else
      render :edit
    end
  end

  def show

  end
  
  private

  def daily_record_params
    params.require(:daily_record).permit(:food_id, :myset_id, :amount, :meal_timing, :date, :custom_id, :comment)
  end
end
