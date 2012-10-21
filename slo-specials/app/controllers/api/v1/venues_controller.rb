class Api::V1::VenuesController < Api::ApiController
  respond_to :json

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all
    Rails.logger.info @venues.count
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    @venue = Venue.find(params[:id])
  end

  # GET /venues/new
  # GET /venues/new.json
  def new
    @venue = Venue.new
  end

  # GET /venues/1/edit
  def edit
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = Venue.new(
      :name => params[:name]
    )
    @venue.save
  end

  # PUT /venues/1
  # PUT /venues/1.json
  def update
    @venue = Venue.find(params[:id])
    @venue.update_attributes(params[:venue])
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
  end
end
