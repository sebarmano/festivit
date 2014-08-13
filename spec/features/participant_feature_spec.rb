require 'rails_helper'

feature "Participant" do
  scenario "Band applies to festival" do
    visit "/"
    click_link "Apply"
  end
end
