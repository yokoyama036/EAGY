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
    myset_food_params[:myset_foods_attributes].each do |index, myset_food_param|
      @myset_food = @myset.myset_foods.build(food_id: myset_food_param[:food_id], amount: myset_food_param[:amount])
      @myset_food.save
    end

    if @myset_food.persisted?
      redirect_to myset_path(@myset), notice: '食材情報を追加しました。'
    else
      render :edit
    end
  end

  def show
    @myset = Myset.find(params[:id])
  end

  private
  def myset_params
    params.require(:myset).permit(myset_foods_attributes: [:id, :food_id, :custom_id, :amount])
  end
end
