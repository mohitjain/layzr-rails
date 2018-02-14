# -*- coding: utf-8 -*-
module Layzr
  module Rails

    # Stores runtime configuration information.
    #
    # Example settings
    #   Layzr::Rails.configure do |c|
    #     c.placeholder  = "/public/img/grey.gif"
    #   end
    class Configuration
      attr_accessor :placeholder
    end
  end
end
