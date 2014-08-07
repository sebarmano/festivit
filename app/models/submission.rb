class Submission < ActiveRecord::Base
  acts_as_taggable
  has_many :attachments
  has_many :submissions, :through => :application_processes
  has_many :fests, :through => :application_processes

  accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true


end
