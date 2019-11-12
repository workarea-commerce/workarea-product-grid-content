module Workarea
  module Storefront
    module ContentBlocks
      class InsightsGridCellViewModel < ProductInsightsViewModel
        include GridContent

        def products
          super.first(number_of_products)
        end

        def sub_grid_cell_class
          if data[:width] == '2'
            'grid__cell--50-at-medium'
          end
        end

        private

        def number_of_products
          (data[:width].presence || 1).to_i * (data[:height].presence || 1).to_i
        end
      end
    end
  end
end
