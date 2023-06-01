class GearsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = <<~SQL
        gears.name ILIKE :query
        OR gears.description ILIKE :query
        OR users.first_name ILIKE :query
        OR users.last_name ILIKE :query
      SQL
      @gears = Gear.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @gears = Gear.all
    end
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
    @reservation = Reservation.new
  end

  private

  def gear_params
    params.require(:gear).permit(:name, :description)
  end
end
