# == Schema Information
#
# Table name: submissions
#
#  id                :integer          not null, primary key
#  bio               :text
#  website           :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  tag               :string(255)
#  participant_id    :integer
#  approve           :boolean
#  complete          :boolean          default(FALSE)
#  group_name        :string(255)
#  facebook_link     :string(255)
#  twitter_link      :string(255)
#  craft_desc        :text
#  photo_desc        :text
#  booth_desc        :text
#  practice_type     :string(255)
#  practice_lic_no   :string(255)
#  practice_exp_date :string(255)
#  practice_years    :string(255)
#  underage          :boolean
#  ticket_req        :string(255)
#  days_avail        :string(255)
#  deposit_type      :string(255)
#  returning         :boolean
#  crew_hist         :text
#  crew_pref         :string(255)
#  comments          :text
#  shift_pref        :string(255)
#  why_volunteer     :text
#  mission_statement :text
#  handouts          :text
#  camping           :boolean
#  electrical        :string(255)
#

class Submission < ActiveRecord::Base
  acts_as_taggable
  has_many :attachments
  has_many :photos
  has_many :songs
  has_many :videos

  has_many :fests, :through => :fest_participant_submissions
  has_many :participants, :through => :fest_participant_submissions
  has_many :fest_participant_role_types
  has_many :fest_participant_submissions

  accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :photos, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :songs, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :videos, :reject_if => :all_blank, :allow_destroy => true
  # accepts_nested_attributes_for :participant

  include Authority::Abilities

  def mail_if_ready
    return nil if complete
    @thing = self.fest_participant_submissions.find_by(submission_id: self.id)
    @participant = Participant.find_by(id: @thing.participant_id)
    SubmissionMailer.init_apply(@participant).deliver
    SubmissionMailer.init_admin(@participant).deliver
  end
end
