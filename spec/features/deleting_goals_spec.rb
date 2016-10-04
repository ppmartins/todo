require 'rails_helper'

feature 'deleting goals' do
  before do
    user = create :user
    goal_one = create(:goal, year: '2016', month: 'September',
                             goal1: 'Goal 1', goal2: 'Goal 2', goal3: 'Goal 3',
                             user_id: user.id)

    sign_in_with user
  end

  scenario 'can delete a goal via the interface' do
    visit '/goals/1/edit'

    click_link 'Delete Goal'

    expect(page).to_not have_content('Goal 1')
    # should be replaced with a flash message as it is in the controller
  end
end
