require 'rails_helper'

describe Ticket do
  it {is_expected.to validate_presence_of(:participant_id)}
end
