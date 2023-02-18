class Event < ApplicationRecord
  DEFAULTS = {
    source: 'Dentolo'
  }

  after_initialize :set_defaults

  private
  
  def set_defaults
    self.source ||= Event::DEFAULTS[:source]
  end
end
