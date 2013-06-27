# Middleman Bootstrap Navbar

[![Gem Version](https://badge.fury.io/rb/middleman-bootstrap-navbar.png)](http://badge.fury.io/rb/middleman-bootstrap-navbar)
[![Build Status](https://secure.travis-ci.org/krautcomputing/middleman-bootstrap-navbar.png)](http://travis-ci.org/krautcomputing/middleman-bootstrap-navbar)
[![Dependency Status](https://gemnasium.com/krautcomputing/middleman-bootstrap-navbar.png)](https://gemnasium.com/krautcomputing/middleman-bootstrap-navbar)
[![Code Climate](https://codeclimate.com/github/krautcomputing/middleman-bootstrap-navbar.png)](https://codeclimate.com/github/krautcomputing/middleman-bootstrap-navbar)

[Middleman](http://middlemanapp.com/) extension to easily generate a [Twitter Bootstrap navbar](http://twitter.github.io/bootstrap/components.html#navbar)

## Installation

Add this line to your application's Gemfile:

    gem 'middleman-bootstrap-navbar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-bootstrap-navbar

## Usage

```ruby
= nav_bar fixed: :top, brand: "My great app", responsive: true do
  = menu_group do
    = menu_item "Home", root_path
    = menu_divider
    = drop_down "Stuff" do
      = menu_item "One", one_path
      = menu_item "Two", two_path
      = menu_item "Three", three_path
      - if current_user.admin?
        = menu_item "Admin", admin_path
    = menu_item "About Us", about_us_path
    = menu_item "Contact", contact_path
  = menu_group pull: :right do
    - if current_user
      = menu_item "Log Out", log_out_path
    - else
      = menu_item "Log In", log_in_path
 ```

Check out the [Twitter Bootstrap Docs](http://twitter.github.io/bootstrap/components.html#navbar) for more info.

## Inspiration

https://github.com/julescopeland/Rails-Bootstrap-Navbar

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
