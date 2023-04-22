class DailyRecordsController < ApplicationController
  before_action :check_user_physical_information
  before_action :authenticate_user!, except: [:about]
  def index
    @daily_records = DailyRecord.all
  end
  
  def new
    @daily_record = DailyRecord.new(date: params[:date])
    @selected_date = params[:selected_date]
    @foods = Food.all
    @mysets = current_user.mysets 
    @custom_foods = current_user.custom_foods
    # ↑自分の設定のみ表示
    @daily_record.daily_record_items.build
    @q = Food.ransack(params[:q])
    @foods = @q.result(distinct: true)
  end

  def create
    @daily_record = DailyRecord.new(daily_record_params)
    @daily_record.user_id = current_user.id
  
    if @daily_record.date.blank?
      flash[:alert] = '日付を選択してください。'
      redirect_to new_daily_record_path
      return
    end
  
    meal_timing_selected = false
  
    if @daily_record.save
      items_created = 0
  
      if params[:daily_record][:daily_record_items][:food_selections].present?
        params[:daily_record][:daily_record_items][:food_selections].each do |food_id, meal_timing|
          next if meal_timing.blank?
          @daily_record.daily_record_items.create!(food_id: food_id, meal_timing: meal_timing)
          items_created += 1
          meal_timing_selected = true
        end
      end
  
      if params[:daily_record][:daily_record_items][:myset_selections].present?
        params[:daily_record][:daily_record_items][:myset_selections].each do |myset_id, meal_timing|
          next if meal_timing.blank?
          @daily_record.daily_record_items.create!(myset_id: myset_id, meal_timing: meal_timing)
          items_created += 1
          meal_timing_selected = true
        end
      end
  
      if params[:daily_record][:daily_record_items][:custom_food_selections].present?
        params[:daily_record][:daily_record_items][:custom_food_selections].each do |custom_food_id, meal_timing|
          next if meal_timing.blank?
          @daily_record.daily_record_items.create!(custom_food_id: custom_food_id, meal_timing: meal_timing)
          items_created += 1
          meal_timing_selected = true
        end
      end
  
      if items_created == 0 || !meal_timing_selected
        flash[:alert] = '記録できませんでした。食事分類を選択してください。'
        @foods = Food.all
        @mysets = Myset.all
        @custom_foods = CustomFood.all
        @q = Food.ransack(params[:q])
        @foods = @q.result(distinct: true)
        render :new
      else
        redirect_to @daily_record
        flash[:success] = '記録しました。'
      end
    end
  end
  
 
  
  def edit
    @daily_record = DailyRecord.find(params[:id])
    @daily_record_items = DailyRecordItem.includes(:food).joins(:daily_record).where(daily_records: { date: @daily_record.date, user_id: @daily_record.user_id })
  end

  def update
    @daily_record = DailyRecord.find(params[:id])
    if @daily_record.update(daily_record_params)
      redirect_to daily_record_path(@daily_record), notice: '更新しました。'
    else
      @daily_record_items = @daily_record.daily_record_items.includes(:food)
      render :edit
    end
  end

  def show
    @daily_record = DailyRecord.find(params[:id])
    @daily_record_items = DailyRecordItem.includes(:food).joins(:daily_record).where(daily_records: { date: @daily_record.date, user_id: @daily_record.user_id })
    @user_physical_information = UserPhysicalInformation.find_by(user_id: current_user.id)
  end

  def destroy
    @daily_record = DailyRecord.find(params[:id])
    @daily_record.destroy
    redirect_to daily_record_path(@daily_record), notice: '記録を削除しました。'
  end


  def about
  end

  def search
  
  end
  
  private

  def daily_record_params
    params.require(:daily_record).permit(
      :date,
      :comment, 
      daily_record_items_attributes: [
        :id, 
        :amount, 
        :myset_id, 
        :food_id, 
        :custom_food_id, 
        :meal_timing, 
        :_destroy
      ]
      )
  end

  def check_user_physical_information
    if user_signed_in? && current_user.user_physical_information.nil?
      redirect_to new_user_physical_information_path
    end
  end
end
