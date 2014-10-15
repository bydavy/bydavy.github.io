source 'https://rubygems.org'
gem 'jekyll'
gem 'jekyll-paginate'
gem 'hpricot'
gem 'redcarpet'
gem 'rouge'

# Add github-pages
require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)
gem 'github-pages', versions['github-pages']