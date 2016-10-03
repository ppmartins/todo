require 'rails_helper'

feature "Create new To Do's" do
  before do
    user = create :user
    sign_in_with user
  end

  scenario 'can create a new To Do' do
    visit new_goal_path
    select '2016', from: 'goal_year'
    select 'October', from: 'goal_month'
    fill_in 'goal_goal1', with: 'Goal 1'
    fill_in 'goal_goal2', with: 'Goal 2'
    fill_in 'goal_goal3', with: 'Goal 3'
    click_button 'Save Goals'

    expect(page).to have_content('2016')
    expect(page).to have_content('October')
    expect(page).to have_content('Goal 1')
    expect(page).to have_content('Goal 2')
    expect(page).to have_content('Goal 3')
  end
end
