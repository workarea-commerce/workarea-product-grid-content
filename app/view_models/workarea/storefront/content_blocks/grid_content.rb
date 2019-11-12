module Workarea
  module Storefront
    module ContentBlocks
      module GridContent
        def position
          # Product grid index starts at 0.
          # Offset position to make admin UI more intuitive
          data[:position] - 1
        end

        def preview_position
          return position unless position > Workarea.config.grid_cell_content_preview_cells
          position % Workarea.config.grid_cell_content_preview_cells
        end

        def cell_width_class
          Workarea.config.product_grid_cell_classes[data[:width].to_sym]
        end

        def cell_styles
          styles = []
          styles << "float: #{float_side};" if float?
          styles.join(" ")
        end

        def float?
          data[:height].to_i > 1 || data[:float] != "none"
        end

        def float_side
          if data[:height].to_i > 1 && data[:float] == "none"
            "left"
          else
            data[:float]
          end
        end
      end
    end
  end
end
