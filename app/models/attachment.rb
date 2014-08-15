class Attachment < ActiveRecord::Base
  require 'faraday'
  require 'typhoeus'
  require 'typhoeus/adapters/faraday'

  self.inheritance_column = nil

  dragonfly_accessor :image
  belongs_to :submission

end
