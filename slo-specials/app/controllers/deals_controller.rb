class DealsController < ApplicationController
  def index
    @deals = Deal.all
  end

  def show

  end
end
