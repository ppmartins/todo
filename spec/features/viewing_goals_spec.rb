require 'spec_helper'

feature 'viewing individual goals' do
  before do
    user = create :user
    goal = create(:goal, user_id: user.id)

    sign_in_with user
  end

  scenario 'can click and view a single goal from the index' do
    visit goals_path
    find(:xpath, "//a[contains(@href,'goals/1')]").click
    expect(page.current_path).to eq(goal_path(1))
  end
end
