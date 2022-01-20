
require 'watir'
require 'webdrivers'
require 'faraday'
require 'nokogiri'
require 'tty-prompt'
require 'active_support'
require 'active_record'
require 'byebug'

module TED_Scraper

  Base_URI = 'https://www.ted.com/talks/'

  Routines =  Dir.entries('./routines/')
    .map { |slug| slug[0..-4] if slug[-2..-1] == 'rb' }
    .compact.sort

end

require_relative './api/slug'
require_relative './api/talk'
require_relative './api/xpaths'
require_relative './db/init'

prompt  = TTY::Prompt.new
routine = prompt.select 'Routine:', TED_Scraper::Routines
require_relative './routines/' << routine
