class PhotosController < ApplicationController
  def destroy
    photo = Photo.find(params[:id])
    @event = photo.event
    if @event.user.id == current_user.id
      photo.destroy!
      @photos = Photo.where(event_id: @event.id)
      respond_to do |format|
        format.html { redirect_to edit_event_path(@event), notice: "Photo successfully removed" }
        format.js
      end
    else
      redirect_to @event, notice: "Can not delete that photo"
    end
  end
end
