require 'rails_helper'

describe 'Posts' do

	context 'when user is signed out' do
		it 'should prompt user to sign in' do
      visit new_post_path

      expect(page).to have_content 'Sign in'
		end
	end

	context 'when user is signed in' do

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

      it 'can fill in an address' do
        visit posts_path
        click_link 'New Post'
        fill_in 'Title', with: 'A brand new post'
        fill_in 'Location', with: '25 City Rd, London'
        click_button 'Post'

        expect(page).to have_content '25 City Rd, London'
      end

      it 'can add a price to a post' do
        visit posts_path

        click_link  'New Post'
        fill_in 'Title', with: 'A post with a price'
        attach_file 'Picture', Rails.root.join('spec/images/time.jpg')
        fill_in 'Price', with: '7.00'
        click_button 'Post'
        visit("/posts/#{Post.first.id}/charge")
     
        expect(page).to have_content 'purchase'
        expect(page).to have_content '$7.00'
      end


		end
	end
end
