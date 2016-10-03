require 'rails_helper'

feature "Create new To Do's" do
  before do
    user = create :user
    sign_in_with user
  end

  scenario 'can create a new To Do' do
    visit '/goals'
    click_link 'New Monthly Planner'
    fill_in 'goal_year', with: 2016
    fill_in 'goal_month', with: 'October'
    fill_in 'goal_goal1', with: 'Goal 1'
    fill_in 'goal_goal2', with: 'Goal 2'
    fill_in 'goal_goal3', with: 'Goal 3'
    click_button 'Save Goals'

    expect(page).tp have_content('2016')
    expect(page).tp have_content('October')
    expect(page).tp have_content('Goal1')
    expect(page).tp have_content('Goal2')
    expect(page).tp have_content('Goal3')
  end
end
