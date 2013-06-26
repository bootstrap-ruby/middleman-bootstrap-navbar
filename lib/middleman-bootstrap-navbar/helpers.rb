module Middleman
  module BootstrapNavbar
    module Helpers
      def nav_bar(options = {}, &block)
        nav_bar_div options do
          navbar_inner_div do
            container_div options[:brand], options[:brand_link], options[:responsive], options[:fluid], &block
          end
        end
      end

      def menu_group(options = {}, &block)
        classes = %w(nav)
        classes << "pull-#{options[:pull]}" if options[:pull].present?
        content_tag :ul, class: classes.join(' '), &block
      end

      def menu_item(name, path = '#', *args)
        options = args.extract_options!
        content_tag :li, class: path.sub(%r(/\z), '') == current_page.url.sub(%r(/\z), '') ? 'active' : nil do
          link_to name, path, options
        end
      end

      def drop_down(name)
        content_tag :li, class: 'dropdown' do
          drop_down_link(name) + drop_down_list {yield}
        end
      end

      def drop_down_divider
        content_tag :li, '', class: 'divider'
      end

      def drop_down_header(text)
        content_tag :li, text, class: 'nav-header'
      end

      def menu_divider
        content_tag :li, '', class: 'divider-vertical'
      end

      def menu_text(text = nil, options = {}, &block)
        pull = options.delete(:pull)
        pull_class = pull.present? ? "pull-#{pull}" : nil
        [pull_class, 'navbar-text'].each do |klass|
          options[:class] = [options[:class], klass].compact.join(' ')
        end
        content_tag :p, options do
          text || yield
        end
      end

      private

      def nav_bar_div(options, &block)
        position = "static-#{options[:static]}" if options[:static]
        position = "fixed-#{options[:fixed]}"   if options[:fixed]
        inverse = (options[:inverse].present? && options[:inverse] == true) ? true : false

        content_tag :div, class: nav_bar_css_class(position, inverse) do
          yield
        end
      end

      def navbar_inner_div(&block)
        content_tag :div, class: 'navbar-inner' do
          yield
        end
      end

      def container_div(brand, brand_link, responsive, fluid, &block)
        content_tag :div, class: fluid ? 'container-flud' : 'container' do
          container_div_with_block brand, brand_link, responsive, &block
        end
      end

      def container_div_with_block(brand, brand_link, responsive, &block)
        output = []
        output << responsive_button if responsive
        output << brand_link(brand, brand_link) if brand.present? || brand_link.present?
        output << (responsive ? responsive_div(&block) : capture(&block))
        output.join("\n").html_safe
      end

      def nav_bar_css_class(position, inverse = false)
        css_class = %w(navbar)
        css_class << "navbar-#{position}" if position.present?
        css_class << 'navbar-inverse' if inverse
        css_class.join(' ')
      end

      def brand_link(name, url = nil, &block)
        link_to *[name, url || '/'].compact, class: 'brand', &block
      end

      def responsive_button
        %(<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>)
      end

      def responsive_div(&block)
        content_tag(:div, class: 'nav-collapse collapse', &block)
      end

      def name_and_caret(name)
        "#{name} #{content_tag(:b, class: 'caret'){}}".html_safe
      end

      def drop_down_link(name)
        link_to(name_and_caret(name), '#', class: 'dropdown-toggle', 'data-toggle' => 'dropdown')
      end

      def drop_down_list(&block)
        content_tag :ul, class: 'dropdown-menu', &block
      end
    end
  end
end
