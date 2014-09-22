require 'rails_helper'

describe 'Likes' do
  before do
    jenny = create(:jenny)
    login_as jenny
    create(:post)
  end

  it "allow users to like posts, updating the post's like count", js: true do
    visit posts_path
    find('.like-link').trigger :click
    expect(page).to have_css '.like_count', text: '1'
  end
end