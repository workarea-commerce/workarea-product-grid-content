require "workarea/testing/teaspoon"

Teaspoon.configure do |config|
  config.root = Workarea::ProductGridContent::Engine.root
  Workarea::Teaspoon.apply(config)
end
