module Scrapers
  class BerghainScraper < BaseScraper
    URL = 'https://www.berghain.berlin/en/program/'.freeze
    SOURCE = 'berghain.berlin'.freeze

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

      doc.css('a.upcoming-event').each do |el|
        save_event(
          datetime: el.css('p.leading-tight').text.split.join(' '),
          title: el.css('h2.font-bold').text.split.join(' '),
          source: self.source
        )
      end
    end

    private

    def uri
      URI(URL)
    end
  end
end