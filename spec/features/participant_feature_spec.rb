require 'rails_helper'

feature "Participant" do
  def apply
    visit "/"
    click_link "Apply"
    expect(page).to have_text("Select what role you would like to apply for:")
    @participant = create(:participant)
  end

  def fill_in_details
    fill_in 'First Name', :with => @participant.fname
    fill_in 'Last Name', :with => @participant.lname
    fill_in 'Email', :with => 'fakeemail@myfakeemail.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Create Participant'
  end

  scenario "craft vendor applies to festival" do
    apply
    fill_in_details
  end
end
