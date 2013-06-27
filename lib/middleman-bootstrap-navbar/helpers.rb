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
        classes << "pull-#{options[:pull]}" if options.has_key?(:pull)
        content = block_given? ? capture(&block) : nil
        content_tag :ul, content, class: classes.join(' ')
      end

      def menu_item(name, path = '#', options = {})
        content_tag :li, class: path.sub(%r(/\z), '') == current_page.url.sub(%r(/\z), '') ? 'active' : nil do
          link_to name, path, options
        end
      end

      def drop_down(name, &block)
        content_tag :li, class: 'dropdown' do
          name_and_caret = "#{name} #{content_tag :b, nil, class: 'caret'}".html_safe
          content = block_given? ? capture(&block) : nil
          link_to(name_and_caret, '#', class: 'dropdown-toggle', data: { toggle: 'dropdown' }) <<
            content_tag(:ul, content, class: 'dropdown-menu')
        end
      end

      def drop_down_divider
        content_tag :li, nil, class: 'divider'
      end

      def drop_down_header(text)
        content_tag :li, text, class: 'nav-header'
      end

      def menu_divider
        content_tag :li, nil, class: 'divider-vertical'
      end

      def menu_text(text = nil, options = {}, &block)
        classes = %w(navbar-text)
        pull = options.delete(:pull)
        classes << "pull-#{pull}" if pull
        options[:class] = classes.join(' ')
        content = text || capture(&block) || nil
        content_tag :p, content, options
      end

      private

      def nav_bar_div(options, &block)
        position = case
        when options.has_key?(:static)
          "static-#{options[:static]}"
        when options.has_key?(:fixed)
          "fixed-#{options[:fixed]}"
        end

        css_class = %w(navbar).tap do |css_class|
          css_class << "navbar-#{position}" if position
          css_class << 'navbar-inverse' if options[:inverse]
        end.join(' ')

        content_tag :div, class: css_class, &block
      end

      def navbar_inner_div(&block)
        content_tag :div, class: 'navbar-inner', &block
      end

      def container_div(brand, brand_link, responsive, fluid, &block)
        content_tag :div, class: fluid ? 'container-fluid' : 'container' do
          content = block_given? ? capture(&block) : nil
          [].tap do |parts|
            parts << responsive_button if responsive
            parts << brand_link(brand, brand_link) if brand || brand_link
            parts << if responsive
              content_tag :div, content, class: 'nav-collapse collapse'
            else
              content
            end
          end.join("\n").html_safe
        end
      end

      def brand_link(name, url)
        link_to name, (url || '/'), class: 'brand'
      end

      def responsive_button
        content_tag :a, class: 'btn btn-navbar', data: { toggle: 'collapse', target: '.nav-collapse' } do
          (0..2).map do
            content_tag :span, nil, class: 'icon-bar'
          end.join("\n").html_safe
        end
      end
    end
  end
end
