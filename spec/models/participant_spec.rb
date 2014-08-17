require 'rails_helper'

describe Participant do
  it {is_expected.to validate_presence_of(:lname)}
  it {is_expected.to validate_presence_of(:fname)}
  it {is_expected.to validate_uniqueness_of(:lname).scoped_to(:fname, :email)}

  it "returns a contact's full name as a string" do
    contact = FactoryGirl.create(:participant, fname: "John", lname: "Smith")
    expect(contact.name).to eq("Smith, John")
  end
end
