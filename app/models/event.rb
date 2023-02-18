class Event < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_all, 
                  against: [:title, :source, :datetime],
                  using: {
                    tsearch: { prefix: true }
                  }

  DEFAULTS = {
    source: 'Dentolo'
  }

  after_initialize :set_defaults

  private
  
  def set_defaults
    self.source ||= Event::DEFAULTS[:source]
  end
end
