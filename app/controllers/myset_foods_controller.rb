class MysetFoodsController < ApplicationController

  def edit
    @myset = Myset.find(params[:id])
    @foods = Food.all
  end

  def update
    @myset_food = MysetFood.find(params[:id])
    if @myset_food.update(myset_food_params)
      redirect_to edit_myset_food_path(myset_food), notice: '更新しました'
    else
      @foods = Food.all
      render :edit
    end
  end

  def destroy
    myset_food = MysetFood.find(params[:id])
    @myset = myset_food.myset
    myset_food.destroy
    flash[:notice] = "食材を削除しました。"
    redirect_to myset_path(@myset)
  end

  private

  def myset_params
    params.require(:myset).permit(:name, :image, myset_foods_attributes: [:id, :amount, :custom_food_id])
  end

end
