class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.gear = Gear.find(params[:gear_id])
    if @reservation.save
      redirect_to profile_path, notice: "La réservation a été créée avec succès."
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date_de_debut, :date_de_fin)
  end
end
