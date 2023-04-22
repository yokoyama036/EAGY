class MysetsController < ApplicationController
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]
  def index
    @mysets = Myset.all
  end
  
  def new
    @myset = Myset.new
  end

  def create
    @myset = Myset.new(name: params[:myset][:name], user_id: current_user.id)
    if @myset.save
      redirect_to edit_myset_path(@myset)
      flash[:success] = 'Mysetを作成しました。'
    else
      flash[:alert] = '作成できませんでした。'
      redirect_to new_daily_record_path
    end
  end

  def edit
    @myset = Myset.find(params[:id])
    @foods = Food.all
    @custom_foods = CustomFood.all
    @myset_food = MysetFood.new
    @q = Food.ransack(params[:q])
    @foods = @q.result(distinct: true)
  end

  def update
    @myset = Myset.find(params[:id])
    if @myset.update(myset_params)
      if params[:myset][:myset_foods].present?
        params[:myset][:myset_foods].values.each do |myset_food_param|
          next unless myset_food_param[:food_id] # food_idがない場合はスキップ
          food_id = myset_food_param[:food_id]
          amount = myset_food_param[:amount]
          @myset.myset_foods.create(food_id: food_id, amount: amount)
        end
      end
      if params[:myset][:myset_custom_foods].present?
        params[:myset][:myset_custom_foods].values.each do |myset_food_param|
          next unless myset_food_param[:custom_food_id]
          custom_food_id = myset_food_param[:custom_food_id]
          amount = myset_food_param[:amount]
          @myset.myset_foods.create(custom_food_id: custom_food_id, amount: amount)
        end
      end
      redirect_to @myset
      flash[:success] = '変更しました'
    else
      flash[:alert] = '記録できませんでした。'
      @foods = Food.all
      @custom_foods = CustomFood.all
      render :edit
    end
  end
  
  def destroy
    @myset = Myset.find(params[:id])
    if @myset.destroy
      flash[:notice] = "Mysetが削除されました。"
      redirect_to new_daily_record_path
    else
      flash[:alert] = "Mysetの削除に失敗しました。"
      redirect_to new_daily_record_path
    end
  end


  def show
    @myset = Myset.find(params[:id])
    @myset_foods = @myset.myset_foods
  end

  private
  def myset_params
    params.require(:myset).permit(
      :name, 
      myset_foods_attributes: [
        :id, 
        :food_id, 
        :custom_food_id, 
        :amount
      ]
      )
  end
  
  def ensure_correct_user
    myset = Myset.find(params[:id])
    unless myset.user == current_user
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end
end
