class CustomFoodsController < ApplicationController
  before_action :set_custom_food, only: [:show, :edit, :update, :destroy]

  def new
    @custom_food = CustomFood.new
  end

  def create
    @custom_food = CustomFood.new(custom_food_params)
    @custom_food.user_id = current_user.id

    if @custom_food.save
      redirect_to @custom_food, notice: 'Custom food was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @custom_food.update(custom_food_params)
      redirect_to @custom_food, notice: 'Custom food was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @custom_food.destroy
    redirect_to custom_foods_url, notice: 'Custom food was successfully destroyed.'
  end

  def show
  end

  private

  def set_custom_food
    @custom_food = CustomFood.find(params[:id])
  end

  def custom_food_params
    params.require(:custom_food).permit(:name, :calorie, :protein, :carbo, :fat, :salt, :unit, :user_id)
  end
end
