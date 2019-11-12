Workarea.configure do |config|
  config.content_areas = config.content_areas.merge(
    "category" => %w(above_results in_grid below_results),
    "customization" => %w(above_results in_grid)
  )

  config.product_grid_cell_classes = {
    "1": "grid__cell--50 grid__cell--25-at-medium grid__cell--20-at-wide",
    "2": "grid__cell--50-at-medium grid__cell--40-at-wide"
  }

  config.grid_cell_content_preview_cells = 10

  config.product_grid_cell_content_block = {
    color_presets: ["#000000", "#ffffff", "#999999", "#ff0000", "#00ff00", "#0000ff"]
  }
end
