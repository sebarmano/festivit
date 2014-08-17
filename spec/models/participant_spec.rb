require 'rails_helper'

describe Participant do
  it {is_expected.to validate_presence_of(:lname)}
  it {is_expected.to validate_presence_of(:fname)}
  it {is_expected.to validate_uniqueness_of(:lname).scoped_to(:fname, :email)}
end
