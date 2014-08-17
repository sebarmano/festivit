require 'rails_helper'

describe Attachment do
  it {is_expected.to validate_presence_of(:submission_id)}
end
