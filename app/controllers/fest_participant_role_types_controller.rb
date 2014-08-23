class FestParticipantRoleTypesController < ApplicationController
  def index
    @fest_participant_role_types = FestParticipantRoleType.all
  end
end