class FoodsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @foods = Food.all
  end
  
  def show
  end

  
  def new
  end

  
  def edit
  end



  def create
  end
  
  def update
  end

  def destroy
  end


end
