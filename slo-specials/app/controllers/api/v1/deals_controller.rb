class Api::V1::DealsController < Api::ApiController
  respond_to :json

  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.all
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
    @deal = Deal.find(params[:id])
  end

  # GET /deals/new
  # GET /deals/new.json
  def new
    @deal = Deal.new
    @venues = Venue.all
  end

  # GET /deals/1/edit
  def edit
    @deal = Deal.find(params[:id])
  end

  # POST /deals
  # POST /deals.json
  # Required: venue_id, title, kind,
  def create
    venue = Venue.find(params[:venue_id])
    if venue
      @deal = venue.deals.new(
        :title => params[:title],
        :kind => params[:kind],
        :price => params[:price]
      )
      @deal.save
    end
  end

  # PUT /deals/1
  # PUT /deals/1.json
  def update
    @deal = Deal.find(params[:id])
    @deal.update_attributes(params[:deal])
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
  end

  def by_kind
    @deals = Deal.where(:kind => params[:kind])
    respond_with @deals
  end

  def by_day
    days = {
      "sunday" => 0,
      "monday" => 1,
      "tuesday" => 2,
      "wednesday" => 3,
      "thursday" => 4,
      "friday" => 5,
      "saturday" => 6,
      "today" => Time.now.wday
    }
    day = days[params[:day]]
    @deals = Array.new
    deals = Deal.all
    deals.each { |d| if d[:time][day] != nil then @deals.push(d) end }
    Rails.logger.info "called by day #{@deals.count} #{day} ***********************"
    respond_with @deals
  end
end
