require "nokogiri"
require "action_view"

require "layzr-rails/version"
require "layzr-rails/configuration"

module Layzr
  module Rails

    def self.configuration
      @configuration ||= Layzr::Rails::Configuration.new
    end

    def self.configuration=(new_configuration)
      @configuration = new_configuration
    end

    # Yields the global configuration to a block.
    #
    # Example:
    #   Layzr::Rails.configure do |config|
    #     config.placeholder = '/public/images/foo.gif'
    #   end
    def self.configure
      yield configuration if block_given?
    end

    def self.reset
      @configuration = nil
    end
  end
end

ActionView::Helpers::AssetTagHelper.module_eval do
  alias :rails_image_tag :image_tag

  def image_tag(*attrs)
    options, args, layzr_options = extract_options_and_args(*attrs)
    image_html = rails_image_tag(*args)

    if options[:lazy]
      to_lazy_image(image_html, layzr_options)
    else
      image_html
    end
  end

  private

  def to_lazy_image(image_html, layzr_options)
    img = Nokogiri::HTML::DocumentFragment.parse(image_html).at_css("img")

    img["data-normal"] = img["src"]
    unless layzr_options.nil?
      img['data-retina'] = layzr_options[:retina] unless layzr_options[:retina].blank?
      img['data-srcset'] = layzr_options[:srcset] unless layzr_options[:srcset].blank?
    end
    img["src"] = Layzr::Rails.configuration.placeholder

    img.to_s.html_safe
  end

  def extract_options_and_args(*attrs)
    args = attrs
    if args.size > 1
      options = attrs.last.dup
      args.last.delete(:lazy)
      layzr_options = args.last.delete(:layzr) || {}
    else
      layzr_options = {}
      options = {}
    end

    [options, args, layzr_options]
  end

end
