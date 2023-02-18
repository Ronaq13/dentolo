require 'open-uri'
require 'net/http'

module Scrapers
  class BaseScraper    
    def self.scrape
      raise 'Not implemented'
    end

    private_class_method :new

    protected

    def event_class
      Event
    end

    def save_event(datetime:, title:, source:)
      event_class.new(
        datetime: datetime,
        title: title,
        source: source
      ).save!
    end
  end
end
