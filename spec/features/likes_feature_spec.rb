require 'rails_helper'

describe 'Likes' do
  before do
    create(:post)
  end

  it "allow users to like posts, updating the post's like count" do
    visit '/posts'
    find('.like-button').click
    expect(page).to have_css '.like_count', text: '1'
  end
end