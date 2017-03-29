class PropertiesController < ApplicationController

  before_action :check_logged_in, only: [:create, :edit, :update, :destroy]
  before_action :set_property, only: [:edit, :update, :destroy, :show]

  def index
    if @current_user.present?
      @properties = @current_user.properties.order(created_at: :desc).paginate(page: params[:page], per_page: 6)
    else
      redirect_to root_path, notice: 'Only for logged in users'
    end
  end

  def new
    @property = Property.new
  end

  def show
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = @current_user.id
    if @property.save
      if params[:properties_photos].present?
        params[:properties_photos].each do |photo|
          PropertyImage.create(image: photo, property_id: @property.id)
        end
      end
      redirect_to property_path(@property), notice: 'Property has been added'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      if params[:properties_photos].present?
        params[:properties_photos].each do |photo|
          PropertyImage.create(image: photo, property_id: @property.id)
        end
      end
      redirect_to edit_property_path(@property), notice: 'Property has been updated successfully'
    else
      render :edit
    end
  end

  def destroy
    if @property.destroy
      redirect_to root_path, notice: 'Property has been removed'
    else
      redirect_to root_path, alert: 'Property not removed. Please, try again later'
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Property not found'
  end

  def property_params
    params.require(:property).permit(:description, :key_features, :floor_plan, :address, :latitude, :longitude, :user_id)
  end

end
