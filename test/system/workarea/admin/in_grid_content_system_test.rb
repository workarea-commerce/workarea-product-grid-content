require 'test_helper'

module Workarea
  module Admin
    class InGridContentSystemTest < SystemTest
      include Admin::IntegrationTest

      setup :create_product

      def test_in_grid_content_block_previews
        _category = create_category(
          name: 'In Grid Content Test',
          product_rules: [{ name: 'search', operator: 'equals', value: '*' }]
        )
        visit admin.catalog_categories_path
        click_link 'In Grid Content Test'
        within '.card--content' do
          click_link 'Content'
        end

        assert(page.has_content?('In Grid Content Test'))
        select 'In Grid', from: 'area_id'
        assert(page.has_content?('This content is empty'))

        click_link 'add_new_block'

        assert(page.has_content?('Choose Your Content Type'))
        click_link 'Product Grid Cell'

        fill_in 'block[data][position]', with: '3'
        click_button 'create_block'

        assert(page.has_content?('Success'))
        select 'In Grid', from: 'area_id'
        assert(page.has_selector?('.content-block'))

        preview_frame = page.find('.content-block__iframe')
        switch_to_frame(preview_frame) do |frame|
          assert(frame.has_selector?('.grid'))
          assert(frame.has_selector?('.grid__cell'), count: Workarea.config.grid_cell_content_preview_cells)
          assert(frame.has_selector?('.product-grid-cell-content-block'))
        end
      end

      def test_in_grid_content_for_search_customizations
        create_search_customization(id: 'foo', product_ids: %w[a b c])

        visit admin.search_customization_path(id: 'foo')

        click_link 'Content'

        select 'In Grid', from: 'area_id'
        assert(page.has_content?('This content is empty'))

        click_link 'add_new_block'

        assert(page.has_content?('Choose Your Content Type'))
        click_link 'Product Grid Cell'

        fill_in 'block[data][position]', with: '3'
        click_button 'create_block'

        assert(page.has_content?('Success'))
      end
    end
  end
end
