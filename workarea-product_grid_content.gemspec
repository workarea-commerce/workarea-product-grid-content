$:.push File.expand_path("../lib", __FILE__)

require "workarea/product_grid_content/version"

Gem::Specification.new do |s|
  s.name        = "workarea-product_grid_content"
  s.version     = Workarea::ProductGridContent::VERSION
  s.authors     = ["Jake Beresford"]
  s.email       = ["jberesford@weblinc.com"]
  s.homepage    = "https://github.com/workarea-commerce/workarea-product-grid-content"
  s.summary     = "Content and products in browse grids"
  s.description = "Extend the workarea platform with functionality to add content to the product grid"
  s.files       = `git ls-files`.split("\n")

  s.add_dependency "workarea", "~> 3.x", ">= 3.4"
end
