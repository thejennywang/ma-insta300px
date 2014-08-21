require 'rails_helper'

describe 'tagging post' do

	before do
    jenny = create(:jenny)
		login_as jenny
	end

	it 'displays tags as links under posts' do
		visit posts_path
		click_link 'New Post'
		fill_in 'Title', with: "A brand new post"
		fill_in 'Tags', with: '#yolo, #swag'
		click_button 'Create post'

		expect(page).to have_link '#yolo'
		expect(page).to have_link '#swag'
	end
end

describe 'filtering by tags' do
	before do
    create(:post, title: 'Post A', tag_list: '#yolo, #swag')
    create(:post, title: 'Post B', tag_list: '#yolo, #yay')
	end

	it 'filters to only show tagged posts' do
		visit posts_path
		click_link '#swag'

		expect(page).to have_css 'h1', text: '#swag'
		expect(page).to have_content 'Post A'
		expect(page).not_to have_content 'Post B'
	end

	it 'should be accessible via pretty URLs' do
		visit '/tags/swag'

		expect(page).to have_content 'Post A'
	end
end