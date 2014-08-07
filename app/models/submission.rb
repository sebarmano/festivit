class Submission < ActiveRecord::Base
  acts_as_taggable
  has_many :attachments
  has_many :fests
  belongs_to :participant

  accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true

end
