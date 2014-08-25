require 'rails_helper'

describe 'Maps' do
  
  before do
    create(:post, address: '25 City Rd, London')
  end

  it 'displays a map when map button is clicked', js: true do
    visit '/posts'
    click_link '25 City Rd, London'

    # testing for prescence of Google Maps map
    expect(page).to have_css '.gm-style'
  end
end