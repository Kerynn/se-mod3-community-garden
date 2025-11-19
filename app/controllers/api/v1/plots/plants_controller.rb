class Api::V1::Plots::PlantsController < ApplicationController
  def create
    plot_plant = PlotPlant.new(plot_plants_params)

    if plot_plant.save
      render json: { success: "Plant added to plot successfully"}, status: :created
    else
      render json: { errors: plot_plant.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  private

  def plot_plants_params
    params.permit(:plot_id, :plant_id, :num_seedlings)
  end
end