require 'rails_helper'

describe 'Maps' do
  
  before do
    jenny = User.create(email: 'j@j.com', password: '12345678', password_confirmation: '12345678')
    login_as jenny
  end
    
  context 'with no address given' do
    it "should not display 'Taken in'" do
      
    end

  end

end