require "test_helper"

module Workarea
  module Storefront
    module ContentBlocks
      class ProductGridCellViewModelViewModelTest < TestCase
        setup :create_content_blocks

        def create_content_blocks
          @block = Content::Block.new(
            type_id: :product_grid_cell,
            data: {
              position: 1,
              width: "1",
              height: "1",
              float: "none"
            }
          )
        end

        def test_adjusts_position_for_zero_based_index
          view_model = ContentBlocks::ProductGridCellViewModel.wrap(@block)
          assert_equal(0, view_model.position)
        end

        def test_returns_cell_width_class_from_config
          view_model = ContentBlocks::ProductGridCellViewModel.wrap(@block)
          assert_equal(Workarea.config.product_grid_cell_classes["1".to_sym], view_model.cell_width_class)
        end

        def test_automatically_floats_tall_blocks_left
          block = Content::Block.new(
            type_id: :product_grid_cell,
            data: {
              position: 1,
              width: "1",
              height: "2",
              float: "none"
            }
          )

          view_model = ContentBlocks::ProductGridCellViewModel.wrap(block)
          assert(view_model.float?)
          assert_equal("left", view_model.float_side)
        end

        def test_automatic_float_can_be_overridden
          block = Content::Block.new(
            type_id: :product_grid_cell,
            data: {
              position: 1,
              width: "1",
              height: "2",
              float: "right"
            }
          )

          view_model = ContentBlocks::ProductGridCellViewModel.wrap(block)
          assert(view_model.float?)
          assert_equal("right", view_model.float_side)
        end

        def test_background_color_is_added_to_block
          block = Content::Block.new(
            type_id: :product_grid_cell,
            data: {
              background_color: "#000000"
            }
          )

          view_model = ContentBlocks::ProductGridCellViewModel.wrap(block)
          assert_includes(view_model.block_styles, "background: #000000")
        end
      end
    end
  end
end
