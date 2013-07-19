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

## Requirements

The necessary files from Bootstrap >= 2.0 have to be included separately, they are not part of this gem.

At least the CSS files for the navbar are required, and the JS files for dropdowns and responsive features, if you want to use those in the navbar.

## Usage

Activate the extensions in `config.rb` in your Middleman app:

```ruby
activate :bootstrap_navbar
```

The gem [bootstrap_navbar](https://github.com/krautcomputing/bootstrap_navbar) is used to generate the HTML. Please refer to the README of that gem for detailed instructions on how to generate the navbar.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
