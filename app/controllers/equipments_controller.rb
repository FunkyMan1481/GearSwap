class EquipmentsController < ApplicationController
  def index
    @equipments = Equipment.all
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)

    if @equipment.save
      redirect_to equipments_path, notice: "L'équipement a été ajouté avec succès."
    else
      render :new
    end
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :description)
  end
end
