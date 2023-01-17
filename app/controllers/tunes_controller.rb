class TunesController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_tune, only: [:show, :edit, :update, :destroy]

  def new
    @tune = Tune.new
    @tune.settings.build
  end

  def index
    @tunes = Boat.find(current_user.current_boat).tunes
  end

  def create
    @tune = Tune.new(tune_params)
    puts params

    respond_to do |format|
      if @tune.save
        format.html { redirect_to tune_url(@tune), notice: "Tune was successfully saved." }
        format.json { render :index, status: :created, location: @tune }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tune.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  private
    
  def set_tune
    @tune = Tune.find(params[:id])
  end

  # Long story about why I had to do this... 
  def tune_params
    if params.has_key?(:tune)
        params.require(:tune).permit(:sailing_session_id, :overall_rating, :upwind_speed, :upwind_angle, 
        :downwind_speed, :downwind_angle, :groove, settings_attributes: [:id, :tune_id, :name, :measurement, :units, :measured_with, :point_of_sail])
    else
        params.permit(:sailing_session_id, :overall_rating, :upwind_speed, :upwind_angle, 
          :downwind_speed, :downwind_angle, :groove)
    end
  end
end
