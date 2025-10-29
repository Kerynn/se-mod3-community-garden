class Api::V1::PlotsController < ApplicationController
  def show
    render json: PlotSerializer.new(Plot.find(params[:id]))
  end
end