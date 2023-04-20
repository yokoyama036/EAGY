class CustomFoodsController < ApplicationController
  before_action :set_custom_food, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]
  def new
    @custom_food = CustomFood.new
  end

  def create
    @custom_food = CustomFood.new(custom_food_params)
    @custom_food.user_id = current_user.id
    prompt ="以下の食品のカロリー、タンパク質、炭水化物、脂質、塩分を次の形で出力して欲しい。カロリー: タンパク質: 炭水化物: 脂質: 塩分: "
    if @custom_food.save
      redirect_to @custom_food
      flash[:notice] = '追加食材を登録しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @custom_food.update(custom_food_params)
      redirect_to @custom_food
      flash[:notice] = '追加食材情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @custom_food.destroy
    redirect_to new_daily_record_path
    flash[:notice] = '追加食材を削除しました。'
  end

  def show
  end

  def fetch_nutrient_data_and_new
    set_common_variable
    name = params[:name]
    if name.blank?
      render json: { error: '食品名が入力されていません。' }, status: :bad_request
      return
    end
    prompt = "#{name}のカロリー、タンパク質、炭水化物、脂質、塩分とその単位数量を次の形で出力して欲しい。カロリー: タンパク質: 炭水化物: 脂質: 塩分: 単位数量:"
    nutrient_data_string = chat_with_gpt(prompt)
    # Extract the nutrient data from the response
    nutrient_data = nutrient_data_string.scan(/[-+]?\d*\.\d+|\d+/).map(&:to_f)
    calorie, protein, carbo, fat, salt, unit = nutrient_data
    render json: {
      calorie: calorie,
      protein: protein,
      carbo: carbo,
      fat: fat,
      salt: salt,
      unit: unit
    }
  end


  private

  def set_custom_food
    @custom_food = CustomFood.find(params[:id])
  end

  def custom_food_params
    params.require(:custom_food).permit(:name, :calorie, :protein, :carbo, :fat, :salt, :unit, :user_id)
  end

  def chat_with_gpt(prompt)
  response = @client.chat(
    parameters: {
      model: 'gpt-3.5-turbo',
      messages: [
        {"role": "user", "content": prompt}
      ],
      temperature: 0.7,
    })
    Rails.logger.debug("GPT-3 Response: #{response.inspect}")
  response.dig('choices', 0, 'message', 'content')
  end

  def set_common_variable
    @client = OpenAI::Client.new(access_token: ENV["API_KEY"])
  end

  def ensure_correct_user
    custom_food = CustomFood.find(params[:id])
    unless custom_food.user == current_user
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end
end
