class Attachment < ActiveRecord::Base
  require 'faraday'
  require 'typhoeus'
  require 'typhoeus/adapters/faraday'

  dragonfly_accessor :image
  belongs_to :submission

end
