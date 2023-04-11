class MysetsController < ApplicationController
  
  def index
    @mysets = Myset.all
  end
  
  def new
    @myset = Myset.new
    @foods = Food.all
  end

  def create
    @myset = Myset.new(name: params[:myset][:name], user_id: current_user.id)
    # @myset = Myset.new(params)
    if @myset.save
      redirect_to new_daily_record_path, notice: 'Mysetを作成しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @myset.update(event_params)
      redirect_to @myset, notice: '記録を更新しました'
    else
      render :edit
    end
  end

  def show
  end

  private
  def myset_params
    params.require(:myset).permit(:name)
  end
end
