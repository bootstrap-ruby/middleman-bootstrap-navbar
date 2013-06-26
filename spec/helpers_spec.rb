require 'spec_helper'

describe Middleman::BootstrapNavbar::Helpers do
  subject do
    Class.new do
      extend Middleman::BootstrapNavbar::Helpers
    end
  end

  describe '#nav_bar' do
    context 'div.navbar' do
      context '"static" parameter' do
        it 'generates the correct HTML' do
          subject.nav_bar(static: 'top').should have_tag(:div, with: { class: 'navbar navbar-static-top' })
          subject.nav_bar(static: 'bottom').should have_tag(:div, with: { class: 'navbar navbar-static-bottom' })
        end
      end

      context '"fixed" parameter' do
        it 'generates the correct HTML' do
          subject.nav_bar(fixed: 'top').should have_tag(:div, with: { class: 'navbar navbar-fixed-top' })
          subject.nav_bar(fixed: 'bottom').should have_tag(:div, with: { class: 'navbar navbar-fixed-bottom' })
        end
      end

      context '"inverse" parameter' do
        it 'generates the correct HTML' do
          subject.nav_bar(inverse: true).should have_tag(:div, with: { class: 'navbar navbar-inverse' })
        end
      end

      context 'no parameters' do
        it 'generates the correct HTML' do
          subject.nav_bar.should have_tag(:div, with: { class: 'navbar' })
          content = subject.nav_bar do
            'foo'
          end
          content.should have_tag(:div, with: { class: 'navbar' }) do
            with_text 'foo'
          end
        end
      end
    end

    context 'div.navbar-inner' do
      it 'generates the correct HTML' do
        subject.nav_bar.should have_tag(:div, with: { class: 'navbar-inner' })
      end
    end

    context 'div.container' do
      it 'generates the correct HTML' do
        subject.nav_bar.should have_tag(:div, with: { class: 'container' })
      end
    end

    describe 'brand and brank_link parameters' do
      it 'generates the correct HTML' do
        subject.nav_bar(brand: 'foo').should have_tag(:a, with: { href: '/', class: 'brand' }) do
          with_text 'foo'
        end
        subject.nav_bar(brand: 'foo', brand_link: 'http://google.com').should have_tag(:a, with: { href: 'http://google.com', class: 'brand' }) do
          with_text 'foo'
        end
        subject.nav_bar(brand_link: 'http://google.com').should have_tag(:a, with: { href: 'http://google.com', class: 'brand' })
      end
    end

    describe '"responsive" parameter' do
      it 'generates the correct HTML' do
        subject.nav_bar(responsive: true).should have_tag(:a, with: { class: 'btn btn-navbar', :'data-toggle' => 'collapse', :'data-target' => '.nav-collapse' }) do
          3.times do
            with_tag :span, with: { class: 'icon-bar' }
          end
        end
      end
    end

    describe '"fluid" parameter' do
      it 'generates the correct HTML' do
        subject.nav_bar(fluid: true).should have_tag(:div, with: { class: 'container-fluid' })
      end
    end
  end

  describe '#menu_group' do
    describe '"pull" parameter' do
      it 'generates the correct HTML' do
        subject.menu_group(pull: 'right').should have_tag(:ul, with: { class: 'nav pull-right' })
      end
    end

    context 'no parameters' do
      it 'generates the correct HTML' do
        subject.menu_group.should have_tag(:ul, with: { class: 'nav' })
        content = subject.menu_group do
          'foo'
        end
        content.should have_tag(:ul, with: { class: 'nav' }) do
          with_text 'foo'
        end
      end
    end
  end

  describe '#menu_item' do
  end

  describe '#drop_down' do
  end

  describe '#drop_down_divider' do
  end

  describe '#drop_down_header' do
  end

  describe '#menu_divider' do
  end

  describe '#menu_text' do
  end
end
