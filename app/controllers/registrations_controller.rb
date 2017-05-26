class RegistrationsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @registration = current_user.registrations.create(registration_params)

    redirect_to @registration.event, notice: "Thank you for registrating!"
  end

  private

  def registration_params
    params.require(:registration).permit(:status, :guests_count, :price, :event_id)
  end
end
