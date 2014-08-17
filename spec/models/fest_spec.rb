require 'rails_helper'

describe Fest do
  it {is_expected.to validate_presence_of(:fest_code)}
  it {is_expected.to validate_uniqueness_of(:fest_code)}
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:start_date)}
end
