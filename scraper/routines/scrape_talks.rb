
browser = Watir::Browser.new :chrome, headless: true
records = SlugRecord.where scraped: false

puts records.length.to_s + " new talks\n\n"

records.each_with_index do |record, i|

  puts " [#{(i + 1).to_s.rjust 4}/#{records.length}] " << record.key

  TED_Scraper::Talk.scrape_from record.key, browser
  record.update scraped: true

end
