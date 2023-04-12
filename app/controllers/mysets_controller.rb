class MysetsController < ApplicationController
  
  def index
    @mysets = Myset.all
  end
  
  def new
    @myset = Myset.new
  end

  def create
    @myset = Myset.new(name: params[:myset][:name], user_id: current_user.id)
    if @myset.save
      redirect_to edit_myset_path(@myset), notice: 'Mysetを作成しました。'
    else
      render :new
    end
  end

  def edit
    @myset = Myset.find(params[:id])
    @foods = Food.all
    @myset_food = MysetFood.new
  end

  def update
    @myset = Myset.find(params[:id])
    if @myset.update(myset_params)
      # 既存のMysetFoodレコードを削除
      # @myset.myset_foods.destroy_all
      # 新しいMysetFoodレコードを作成して保存
      if params[:myset][:myset_foods].present?
        params[:myset][:myset_foods].values.each do |myset_food_param|
          next unless myset_food_param[:food_id] # food_idがない場合はスキップ
          food_id = myset_food_param[:food_id]
          amount = myset_food_param[:amount]
          @myset.myset_foods.create(food_id: food_id, amount: amount)
        end
      end
      redirect_to @myset, notice: '記録を更新しました'
    else
      @foods = Food.all
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
    params.require(:myset).permit(:name, myset_foods_attributes: [:id, :food_id, :amount])
  end
end
