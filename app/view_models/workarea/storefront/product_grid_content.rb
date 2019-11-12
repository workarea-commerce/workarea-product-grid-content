module Workarea
  module Storefront
    module ProductGridContent
      def product_position_offset
        page_number = options[:page].present? ? options[:page].to_i - 1 : 0

        page_number * Workarea.config.per_page
      end

      def product_grid_content_for(position)
        product_grid_content_blocks.select do |block|
          block.position == (position + product_position_offset)
        end
      end
    end
  end
end
