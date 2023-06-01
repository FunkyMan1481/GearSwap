class GearsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = <<~SQL
        gears.name ILIKE :query
        OR gears.description ILIKE :query
      SQL
      @gears = Gear.joins(:user).where(sql_query, query: "%#{params[:query]}%", localisation: "%#{params[:localisation]}%")
    elsif params[:localisation].present?
      @coordinates = Geocoder.coordinates(params[:localisation])
      @latitude = @coordinates[0]
      @longitude = @coordinates[1]
      @gears = Gear.near([@latitude, @longitude], 10)
    else
      @gears = Gear.all
    end
    # OR gears.localisation ILIKE :localisation
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
