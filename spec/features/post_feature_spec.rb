require 'rails_helper'

describe 'Posts' do

	context 'user signed out' do
		it 'should prompt user to sign in' do
      visit new_post_path

      expect(page).to have_content 'Sign in'
		end
	end

	context 'user signed in' do

		before do
			jenny = create(:jenny)
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
				create(:post, title: 'Hello world')
			end

			it 'displays a list of all posts' do
				visit posts_path
				expect(page).to have_content 'Hello world'
			end
		end 

		context 'creating posts' do
			it 'adds the post from a form' do
				visit posts_path
				click_link 'New Post'
				fill_in 'Title', with: 'A brand new post'
				click_button 'Post'

				expect(page).to have_content 'A brand new post'
				expect(current_path).to eq '/posts'
			end

			it 'displays no image, if no picture attached' do
				visit posts_path
				click_link 'New Post'
				fill_in 'Title', with: 'A brand new post'
				click_button 'Post'

				expect(page).not_to have_css 'img.uploaded-pic'
			end

			it 'can attach an image to a post' do
				visit posts_path
				click_link 'New Post'
				fill_in 'Title', with: 'A brand new post'
				attach_file 'Picture', Rails.root.join('spec/images/time.jpg')
				click_button 'Post'

				expect(page).to have_css 'img.uploaded-pic'
			end
		end
	end
end
