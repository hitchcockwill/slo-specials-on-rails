class Api::V1::VenuesController < Api::ApiController
  respond_to :json
  before_filter :deals_today

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

  def deals_today
    venues = Venue.all
    today = Time.now.wday
    venues.each do |v|
      deals_today = false
      if !v.deals.empty?
        v.deals.each do |d|
          if d[:time][today] then deals_today = true end
        end
      end
      v[:deals_today] = deals_today
      v.save
    end
  end
end
