# Middleman Bootstrap Navbar

[![Gem Version](https://badge.fury.io/rb/middleman-bootstrap-navbar.png)](http://badge.fury.io/rb/middleman-bootstrap-navbar)
[![Build Status](https://secure.travis-ci.org/bootstrap-ruby/middleman-bootstrap-navbar.png)](http://travis-ci.org/bootstrap-ruby/middleman-bootstrap-navbar)
[![Dependency Status](https://gemnasium.com/bootstrap-ruby/middleman-bootstrap-navbar.png)](https://gemnasium.com/bootstrap-ruby/middleman-bootstrap-navbar)
[![Code Climate](https://codeclimate.com/github/bootstrap-ruby/middleman-bootstrap-navbar.png)](https://codeclimate.com/github/bootstrap-ruby/middleman-bootstrap-navbar)

[Middleman](http://middlemanapp.com/) extension to easily generate a [Bootstrap](https://getbootstrap.com/) navbar

## Installation

Add this line to your application's Gemfile:

    gem 'middleman-bootstrap-navbar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-bootstrap-navbar

## Requirements

## Middleman

Middleman >= 3.1

## Bootstrap

Bootstrap >= 2.0

The necessary Bootstrap files have to be included separately, they are not part of this gem.

At least the CSS files for the navbar are required, and the JS files for dropdowns and responsive features, if you want to use those in the navbar.

## Usage

### Activate extension

Activate the extensions in `config.rb` in your Middleman app:

```ruby
activate :bootstrap_navbar
```

### Set Bootstrap version

This gem needs to know which Bootstrap version you are using, because the navbar HTML looks different in different Bootstrap versions.

If you're using either the [`bootstrap-sass`](https://github.com/twbs/bootstrap-sass) or [`bootstrap`](https://github.com/twbs/bootstrap-rubygem) gem, you're all set because the Boostrap version will be sniffed automatically from those gems' versions. Make sure to include the `bootstrap-sass` or `bootstrap` gem before `rails_bootstrap_navbar` in your Gemfile though.

If you include the Bootstrap CSS and JS some other way, you need to set the Bootstrap version when activating the extension:

```ruby
activate :bootstrap_navbar do |bootstrap_navbar|
  bootstrap_navbar.bootstrap_version = '4.0.0'
end
```

### Output HTML

The gem [bootstrap-navbar](https://github.com/bootstrap-ruby/bootstrap-navbar) is used to generate the HTML. Please refer to the gem's [README](https://github.com/bootstrap-ruby/bootstrap-navbar/blob/master/README.md) and the following Wiki entries for detailed instructions on how to generate the navbar:

[Usage with Bootstrap 2](https://github.com/bootstrap-ruby/bootstrap-navbar/wiki/Usage-with-Bootstrap-2)

[Usage with Bootstrap 3](https://github.com/bootstrap-ruby/bootstrap-navbar/wiki/Usage-with-Bootstrap-3)

[Usage with Bootstrap 4](https://github.com/bootstrap-ruby/bootstrap-navbar/wiki/Usage-with-Bootstrap-4)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Support

If you like this project, consider [buying me a coffee](https://www.buymeacoffee.com/279lcDtbF)! :)
