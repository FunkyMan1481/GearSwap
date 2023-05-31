class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @gears = Gear.all
    @markers = @gears.geocoded.map do |gear|
      {
        lat: gear.latitude,
        lng: gear.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { gear: gear }),
        marker_html: render_to_string(partial: "marker", locals: { gear: gear })
      }
    end
  end

  def profile
    @user = current_user
    @reservations = current_user.reservations
  end
end
