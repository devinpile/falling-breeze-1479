class PlotPlant < ApplicationRecord
  belongs_to :plot
  belongs_to :plant

  def self.current_plot_plant(plant, plot)
    where('plant_id = ? and plot_id = ?', plant, plot).last
  end
end