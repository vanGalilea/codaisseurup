class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @registration = current_user.registrations.new(registration_params.merge(event_id: params[:event_id]))
    if @registration.event.available?
      @registration.save
      redirect_to @registration.event, notice: "Thank you for registering!"
    else
      redirect_to @registration.event, notice: "Sorry! This event is full"
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:guests_count)
  end
end
