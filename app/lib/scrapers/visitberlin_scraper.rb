module Scrapers
  class VisitberlinScraper < BaseScraper
    URL = 'https://www.visitberlin.de/en/event-calendar-berlin'.freeze
    SOURCE = 'visitberlin.de'.freeze

    attr_reader :source

    def self.scrape
      self.new.scrape
    end

    def initialize()
      @source = SOURCE
    end

    def scrape
      response = Net::HTTP.get_response(uri)
      doc = Nokogiri::HTML(response.body)

      doc.css('li.l-list__item').each do |el|
        save_event(
          datetime: datetime(el),
          title: el.css('h2.teaser-search__heading').text.split.join(' '),
          source: self.source
        )
      end
    end

    private

    def uri
      URI(URL)
    end

    def datetime(el)
      date_val = []
      el.css('time').first(2).each do |time_el|
        date_val.push(time_el.text)
      end

      time_val = el.css('span.me__content').text.split.last(2).join(' ')

      date_val.join(' - ') + ' ' + time_val
    end
  end
end