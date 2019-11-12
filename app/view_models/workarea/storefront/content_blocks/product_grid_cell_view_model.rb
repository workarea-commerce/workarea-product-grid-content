module Workarea
  module Storefront
    module ContentBlocks
      class ProductGridCellViewModel < ContentBlockViewModel
        include GridContent

        def image
          @image ||= find_asset(data[:asset])
        end

        def block_styles
          styles = []
          styles << background
          styles.join(" ")
        end

        def background
          "background: #{model.data[:background_color]} url(#{image.url}) no-repeat;"
        end
      end
    end
  end
end
