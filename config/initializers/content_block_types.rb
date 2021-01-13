Workarea.define_content_block_types do
  block_type "Product Grid Cell" do
    description "Content block for your product grid"
    view_model "Workarea::Storefront::ContentBlocks::ProductGridCellViewModel"

    fieldset "Grid" do
      field "Position", :integer, default: 1, min: 1, tooltip: "Where the content block will appear within the product grid"
      field "Width", :options, values: [["1 cell", 1], ["2 cells", 2]], default: 1, tooltip: "Set the width of the content block. Use preview to ensure that a 2 cell width block is positioned so that it will wrap correctly at all breakpoints."
      field "Height", :options, values: [["1 cell", 1], ["2 cells", 2]], default: 1, tooltip: "Note: When creating a 2 cell height the block must be floated left or right in order for the grid to flow around the content properly. If float is set to 'none' it will automatically float left."
      field "Float", :options, values: ["none", "left", "right"], default: "none", tooltip: "Forces the content block to the left or right side of the row. This setting is intended for use with a 2 cell height block."
    end

    fieldset "Content" do
      field "Asset", :asset, file_types: "image", default: find_asset_id_by_file_name("960x470_light.png"), html_data_attributes: { media_mode: ["resize", "crop", "switch"] }
      field "Background Color", :color, default: "#000000", presets: Workarea.config.product_grid_cell_content_block[:color_presets]
      field "Heading", :string, default: "Shop the look"
      field "Link", :url, default: "/"
      field "Link Text", :string, default: "Click Me!"
      field "Link Style", :options, values: ["button", "text-button", "link"], default: "button"
    end
  end

  block_type "Insights Grid Cell" do
    description "Injust insights driven products to the product grid"
    view_model "Workarea::Storefront::ContentBlocks::InsightsGridCellViewModel"

    fieldset "Grid" do
      field "Position", :integer, default: 1, min: 1, tooltip: "Where the content block will appear within the product grid"
      field "Width", :options, values: [["1 cell", 1], ["2 cells", 2]], default: 1, tooltip: "Set the width of the content block. Use preview to ensure that a 2 cell width block is positioned so that it will wrap correctly at all breakpoints."
      field "Height", :options, values: [["1 cell", 1], ["2 cells", 2]], default: 1, tooltip: "Note: When creating a 2 cell height the block must be floated left or right in order for the grid to flow around the content properly. If float is set to 'none' it will automatically float left."
      field "Float", :options, values: ["none", "left", "right"], default: "none", tooltip: "Forces the content block to the left or right side of the row. This setting is intended for use with a 2 cell height block."
    end

    fieldset "Insights" do
      field 'Type', :options, values: [
        'Cold Products',
        'Hot Products',
        'Most Discounted Products',
        'Non Sellers',
        'Products To Improve',
        'Promising Products',
        'Star Products',
        'Top Products',
        'Trending Products'
      ], default: 'Top Products'
    end
  end
end
