class Garden < ApplicationRecord
  has_many :plots

  def unique_plants_short_harvest
    plots.joins(:plants).where('plants.days_to_harvest < ?', 100).distinct.pluck(:name)
    # wip = plots.joins(:plants).select("plots.*, plants.name AS plant_name").where('plants.days_to_harvest < ?', 100).distinct
  end
end
