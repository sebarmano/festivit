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
    fill_in 'Password', :with => 'password', match: :prefer_exact
    fill_in 'Password confirmation', :with => 'password', match: :prefer_exact
    click_button 'Store Point of Contact'
  end

  scenario "craft vendor applies to festival" do
    apply
    fill_in_details
  end
end
