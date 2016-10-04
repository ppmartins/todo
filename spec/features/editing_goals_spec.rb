require 'rails_helper'

feature 'editing posts' do
  before do
    user = create :user
    user_two = create(:user, email: 'fake2@email.com',
                             user_name: 'Faking',
                             password: 'fakepassword2',
                             password_confirmation: 'fakepassword2',
                             id: user.id + 1)
    goal = create(:goal, user_id: user.id)
    goal_two = create(:goal, year: '2016', month: 'October',
                             goal1: 'Goal 1', goal2: 'Goal 2', goal3: 'Goal 3',
                             user_id: user.id + 1)

    sign_in_with user
  end

  scenario 'can edit a goal as the owner' do
    visit '/goals/1'
    expect(page).to have_content('Edit Goals')

    click_link 'Edit Goals'
    select '2016', from: 'goal_year'
    select 'October', from: 'goal_month'
    fill_in 'goal_goal1', with: 'goal 1'
    fill_in 'goal_goal2', with: 'goal 2'
    fill_in 'goal_goal3', with: 'goal 3'
    click_button 'Save Goals'

    expect(page).to have_content('goal 1')
    expect(page).to have_content('goal 2')
    expect(page).to have_content('goal 3')
  end

  scenario "cannot edit a goal that doesn't belong to the user" do
    visit 'goals/2'
    expect(page).to_not have_content('Edit Goals')
  end

  scenario "cannot edit a goal that doesn't belong to user, through direct url" do
    visit 'goals/2/edit'
    expect(page.current_path).to eq root_path
    expect(page).to have_content("This goal doesn't belong to you")
  end
end
