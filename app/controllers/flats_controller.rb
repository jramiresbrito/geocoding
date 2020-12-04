class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  # GET /flats
  def index
    @flats = Flat.all

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "flats_details", locals: { flat: flat }),
        image_url: helpers.asset_url('logo.png')
      }
    end
  end

  # GET /flats/1
  def show
  end

  # GET /flats/new
  def new
    @flat = Flat.new
  end

  # GET /flats/1/edit
  def edit
  end

  # POST /flats
  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to @flat, notice: 'Flat was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /flats/1
  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: 'Flat was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /flats/1
  def destroy
    @flat.destroy
    redirect_to flats_url, notice: 'Flat was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_flat
    @flat = Flat.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def flat_params
    params.require(:flat).permit(:name, :address)
  end
end
