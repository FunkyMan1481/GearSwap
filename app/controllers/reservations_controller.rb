class ReservationsController < ApplicationController
  def index
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to reservations_path, notice: "La réservation a été créée avec succès."
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:equipment_id, :user_id, :start_date, :end_date)
  end
end
