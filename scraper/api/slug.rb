
module TED_Scraper::Slug

  def self.from_page i

    url  = TED_Scraper::Base_URI + '?page=' + i.to_s

    html = Faraday.get url
    doc  = Nokogiri::HTML html.body

    doc
      .xpath( XPATH[:slugs][:results_container] )
      .css('div.col h4 a').each { |a| 

        href = a.attributes['href'].value

        if href[0..6] == '/talks/'
          unless SlugRecord.exists? (slug = href[7..])
            SlugRecord.create key: slug, scraped: false
            puts href
          end
        end

      }

  end

end
