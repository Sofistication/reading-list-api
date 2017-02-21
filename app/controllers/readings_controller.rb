# frozen_string_literal: true

class ReadingsController < ProtectedController
  before_action :set_reading, only: [:show, :update, :destroy]

  # # GET /readings
  # def index
  #   @readings = Reading.all
  #
  #   render json: @readings
  # end
  #
  # # GET /readings/1
  # def show
  #   render json: @reading
  # end

  # POST /readings
  def create
    @reading = Reading.new(reading_params)

    if @reading.save
      render json: @reading, status: :created
    else
      render json: @reading.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /readings/1
  def update
    if @reading.update(reading_params)
      head :no_content
    else
      render json: @reading.errors, status: :unprocessable_entity
    end
  end

  # DELETE /readings/1
  def destroy
    @reading.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_reading
    @reading = Reading.find(params[:id])
  end
  private :set_reading

  # Only allow a trusted parameter "white list" through.
  def reading_params
    params.require(:reading).permit(:user_id, :book_id, :list, :status)
  end
  private :reading_params
end
