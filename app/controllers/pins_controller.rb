class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def show

  end

  def edit

  end

  def update
    if @pin.update(pin_params)
       redirect_to @pin, notice: "Pin was succesfully updated"
    else
       render 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path
  end

  def new
    @pin = current_user.pins.build
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: "Succesfully created new Pin"
    else
      render 'new'
    end
  end


  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:image, :title, :description)
    end
end
