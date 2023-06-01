class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @user = current_user
    @reservations = current_user.reservations
  end
end
