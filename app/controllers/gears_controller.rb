class GearsController < ApplicationController
  def index
    @gears = Gear.all
  end

  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new(gear_params)

    if @gear.save
      redirect_to gears_path, notice: "L'équipement a été ajouté avec succès."
    else
      render :new
    end
  end

  def show
    @gear = Gear.find(params[:id])
  end

  private

  def gear_params
    params.require(:gear).permit(:name, :description)
  end
end
