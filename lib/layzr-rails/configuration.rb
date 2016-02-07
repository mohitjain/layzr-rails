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

      def placeholder
        @placeholder
      end

      def placeholder=(new_placeholder)
        @placeholder = new_placeholder
      end

    end
  end
end
