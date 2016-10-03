require 'rails_helper'

feature 'Can see a list of goals on the index' do
  before do
    user = create :user
    goal_one = create(:goal, year: '2016', month: 'September',
                             goal1: 'Goal 1', goal2: 'Goal 2', goal3: 'Goal 3',
                             user_id: user.id)
    goal_two = create(:goal, year: '2016', month: 'October',
                             goal1: 'Goal 1', goal2: 'Goal 2', goal3: 'Goal 3',
                             user_id: user.id)

    sign_in_with user
  end
  scenario 'the index lists all goals' do
    visit goals_path
    expect(page).to have_content('September 2016')
    expect(page).to have_content('October 2016')
  end
end
