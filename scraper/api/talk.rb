
module TED_Scraper::Talk

  def self.scrape_from slug, browser = Watir::Browser.new(:chrome, headless: true), create=true

    browser.goto TED_Scraper::Base_URI + '/' + slug + '/transcript'

    doc = Nokogiri::HTML browser.html
    
    title       = doc.css( 'head meta[property=og\:title]'       )[0].attributes['content'].value
    speaker     = doc.css( 'head meta[name=author]'              )[0].attributes['content'].value
    description = doc.css( 'head meta[property=og\:description]' )[0].attributes['content'].value
    tags        = doc.css( 'head meta[property=og\:video\:tag]'  ).map { |tag| tag.attributes['content'].value.downcase }
    context     = doc.css( 'script[type=\'application/ld+json\']')[0].text
    context     = JSON.parse context

    views       = context['interactionStatistic']['userInteractionCount'].to_i
    event       = doc.xpath( XPATH[:talks][:event] ).text
    year        = doc.xpath( XPATH[:talks][:year]  ).text[-4..-1].to_i

    sleep 2
    doc = Nokogiri::HTML browser.body.html

    transcript  = doc.css('aside span.block').to_a

    unless transcript.empty?
      transcript = transcript.map { |span| span.text }
      transcript = transcript.join(" ").gsub("\n", " ")
    end

    if create
      TalkRecord.create                                    \
        slug: slug, title: title, speaker: speaker,        \
        description: description, transcript: transcript,  \
        tags: tags, event: event, year: year, views: views \
        unless TalkRecord.exists? slug
    else
      return TalkRecord.new                                \
        slug: slug, title: title, speaker: speaker,        \
        description: description, transcript: transcript,  \
        tags: tags, event: event, year: year, views: views
    end

  end

end
