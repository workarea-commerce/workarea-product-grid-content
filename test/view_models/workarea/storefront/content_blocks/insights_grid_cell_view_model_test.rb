require "test_helper"

module Workarea
  module Storefront
    module ContentBlocks
      class InsightsGridCellViewModelViewModelTest < TestCase
        setup :create_products
        setup :create_content_blocks

        def create_products
          create_product(id: 'foo')
          create_product(id: 'bar')
          create_product(id: 'baz')
          create_hot_products(
            results: [
              { product_id: 'foo' },
              { product_id: 'bar' }
            ]
          )
        end

        def create_content_blocks
          @block = Content::Block.new(
            type_id: :insights_grid_cell,
            data: {
              position: 1,
              width: "1",
              type: "Hot Products"
            }
          )

          @wide_block = Content::Block.new(
            type_id: :insights_grid_cell,
            data: {
              position: 1,
              width: "2",
              type: "Hot Products"
            }
          )
        end

        def test_products
          view_model = ContentBlocks::ProductGridCellViewModel.wrap(@block)
          assert_equal(1, view_model.products.count)
          assert_equal('foo', view_model.products.first.id)

          wide_view_model = ContentBlocks::ProductGridCellViewModel.wrap(@wide_block)
          assert_equal(2, wide_view_model.products.count)
          assert_equal('foo', wide_view_model.products.first.id)
          assert_equal('bar', wide_view_model.products.second.id)
        end

        def test_sub_grid_cell_width
          view_model = ContentBlocks::ProductGridCellViewModel.wrap(@block)
          assert_nil(view_model.sub_grid_cell_class)

          wide_view_model = ContentBlocks::ProductGridCellViewModel.wrap(@wide_block)
          assert_equal('grid__cell--50-at-medium', wide_view_model.sub_grid_cell_class)
        end
      end
    end
  end
end
