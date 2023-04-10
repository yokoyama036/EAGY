class DailyRecordsController < ApplicationController

  def index
    @daily_records = DailyRecord.all
  end
  
  def new
    @daily_record = DailyRecord.new(date: params[:date])
    @foods = Food.all
    @mysets = Myset.all
    @daily_record.daily_record_items.build
  end

  def create
    # puts "Before: #{daily_record_params.inspect}"
    @daily_record = DailyRecord.new(daily_record_params)
    # puts "After: #{@daily_record.inspect}"
    #  @daily_record = DailyRecord.new(user_id: current_user.id, meal_timing: params[:daily_record][:meal_timing], date: params[:daily_record][:date], comment: params[:daily_record][:comment])
    # @daily_record = DailyRecord.new(user_id: current_user.id, date: params[:daily_record][:date], comment: params[:daily_record][:comment])
    if @daily_record.save
      redirect_to @daily_record, notice: '記録しました。'
    else
      @foods = Food.all
      @mysets = Myset.all
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
    @daily_record = DailyRecord.find(params[:id])
    @daily_record_items = @daily_record.daily_record_items
  end
  
  private

  def daily_record_params
    params.require(:daily_record).permit(:date, :comment, daily_record_items_attributes: [:id, :amount, :myset_id, :food_id, :custom_food_id, :meal_timing, :_destroy])
  end
end
