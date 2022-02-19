
browser = Watir::Browser.new :chrome, headless: true
records = TalkRecord.where views: nil

puts records.length.to_s + " updating talks\n\n"

records.each_with_index do |record, i|

  puts " [#{(i + 1).to_s.rjust 4}/#{records.length}] " << record.slug

  talk = TED_Scraper::Talk.scrape_from record.slug, browser, create=false
  TalkRecord.find_by(slug: talk.slug).update(views: talk.views)

end
