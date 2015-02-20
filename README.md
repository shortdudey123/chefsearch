# ChefSearch

[![Build Status](https://travis-ci.org/shortdudey123/chefsearch.svg?branch=master)](https://travis-ci.org/shortdudey123/chefsearch)
[![Gem Version](http://img.shields.io/gem/v/chefsearch.svg)](https://rubygems.org/gems/chefsearch)
[![Coverage Status](https://img.shields.io/coveralls/shortdudey123/chefsearch/master.svg)](https://coveralls.io/r/shortdudey123/chefsearch?branch=master)
[![Code Climate](https://codeclimate.com/github/shortdudey123/chefsearch/badges/gpa.svg)](https://codeclimate.com/github/shortdudey123/chefsearch)
[![Dependency Status](https://img.shields.io/gemnasium/shortdudey123/chefsearch.svg)](https://gemnasium.com/shortdudey123/chefsearch)


Search a Chef server via CLI or API given a role, name, or Chef environment

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chefsearch'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chefsearch

## Usage

### CLI

```
chefsearch --help
Usage: ChefSearch [options]

Options:
  -n, --name=<s>           Node name
  -r, --role=<s>           Chef role
  -e, --environment=<s>    Chef environment
  -c, --config=<s>         Chef knife config filepath
  -v, --version            Print version and exit
  -h, --help               Show this message
```

### API

Print out all nodes from Chef server

```ruby
require `chefsearch`
c = ChefSearch::Search.new
puts c.search
```

Print out nodes from Chef server using the given knife config and meeting the search criteria

```ruby
require `chefsearch`
c = ChefSearch::Search.new(config)
puts c.search(name: name,
            role: role,
            chef_environment: environment
            )
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/shortdudey123/chefsearch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
