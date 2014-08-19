require 'rails_helper'

describe 'tagging post' do

	before do
		jenny = User.create(email: 'j@j.com', password: '12345678', password_confirmation: '12345678')
		login_as jenny
	end

	it 'displays tags as links under posts' do
		visit posts_path
		click_link 'New post'
		fill_in 'Title', with: "A brand new post"
		fill_in 'Tags', with: '#yolo, #swag'
		click_button 'Create post'

		expect(page).to have_link '#yolo'
		expect(page).to have_link '#swag'
	end
end