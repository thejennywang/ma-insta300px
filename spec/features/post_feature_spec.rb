require 'rails_helper'

describe 'Posts' do

	context 'user logged out' do
		it 'should prompt user to log in' do
			visit posts_path
			click_link 'New post'

			expect(page).to have_content 'Log in'
		end
	end

	context 'user logged in' do

		before do
			jenny = User.create(email: 'j@j.com', password: '12345678', password_confirmation: '12345678')
			login_as jenny
		end

		context 'no posts' do
			it 'shows a message' do
				visit posts_path
				expect(page).to have_content 'No posts yet'
			end
		end

		context 'with posts' do
			before do
				Post.create(title: 'Hello world')
			end

			it 'displays a list of all posts' do
				visit posts_path
				expect(page).to have_content 'Hello world'
			end
		end 

		context 'creating posts' do
			it 'adds the post from a form' do
				visit posts_path
				click_link 'New post'
				fill_in 'Title', with: 'A brand new post'
				click_button 'Create post'

				expect(page).to have_content 'A brand new post'
				expect(current_path).to eq '/posts'
			end

			it 'can attach an image to a post' do
				visit posts_path
				click_link 'New post'
				fill_in 'Title', with: 'A brand new post'
				attach_file 'Picture', Rails.root.join('spec/images/london.jpg')
				click_button 'Create post'

				expect(page).to have_css 'img.uploaded-pic'
			end
		end
	end
end