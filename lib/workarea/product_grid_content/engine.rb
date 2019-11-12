module Workarea
  module ProductGridContent
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::ProductGridContent
    end
  end
end
