
require 'rover-df'

slugs = Rover::DataFrame.new SlugRecord.all
talks = Rover::DataFrame.new TalkRecord.all

File.write  '../data/slugs.csv', (slugs = slugs[ slugs.keys[..0] ]).to_csv
File.write  '../data/talks.csv', (talks = talks[ talks.keys[..7] ]).to_csv
