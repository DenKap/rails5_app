class HomeController < ApplicationController

  def index
    @properties = Property.order(created_at: :desc).paginate(page: params[:page], per_page: 6)
  end

end
