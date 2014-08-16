# == Schema Information
#
# Table name: attachments
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  link          :string(255)
#  image_uid     :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  submission_id :integer
#  type          :string(255)
#

class Attachment < ActiveRecord::Base
  require 'faraday'
  require 'typhoeus'
  require 'typhoeus/adapters/faraday'

  dragonfly_accessor :image
  belongs_to :submission

end
