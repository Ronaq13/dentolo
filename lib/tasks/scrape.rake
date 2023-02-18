namespace :scrape do
  desc 'Scrape data from berghain.berlin'
  task berghain: :environment do
    puts 'Success | Berghain' if Scrapers::BerghainScraper.scrape
  end

  desc 'Scrape data from visitberlin.de'
  task visitberlin: :environment do
    puts 'Success | Visitberlin' if Scrapers::VisitberlinScraper.scrape
  end
end
