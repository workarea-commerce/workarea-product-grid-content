module Workarea
  Plugin.append_javascripts(
    "storefront.modules",
    "workarea/storefront/product_grid_content/modules/match_product_summary_height"
  )

  Plugin.append_stylesheets(
    "storefront.components",
    "workarea/product_grid_content/components/content_block_product_grid_cell",
    "workarea/product_grid_content/components/product_grid_cell_content_block",
    "workarea/product_grid_content/components/pagination_product_grid_content"
  )

  Plugin.append_partials(
    "storefront.category_browse_grid_item",
    "workarea/storefront/shared/product_grid_content_cell"
  )

  Plugin.append_partials(
    "storefront.search_grid_item",
    "workarea/storefront/shared/product_grid_content_cell"
  )
end
