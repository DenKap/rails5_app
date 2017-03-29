class PropertyImagesController < ApplicationController

  def destroy
    pic = PropertyImage.find(params[:id])
    if pic.present?
      pic.destroy
      redirect_to edit_property_path(pic.property), notice: 'Photo has been removed successfully'
    else
      redirect_to root_path, alert: 'Photo not found'
    end
  end

end
