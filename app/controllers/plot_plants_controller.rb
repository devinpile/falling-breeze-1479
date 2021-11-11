class PlotPlantsController < ApplicationController
  def destroy
    plot_plant = PlotPlant.current_plot_plant(params[:id], params[:plot_id])
    plot_plant.destroy
    redirect_to plots_path
  end
end