class Attachment < ActiveRecord::Base
  require 'faraday'
  require 'typhoeus'
  require 'typhoeus/adapters/faraday'

  self.inheritance_column = nil

  dragonfly_accessor :image
  dragonfly_accessor :song
  belongs_to :submission

end
