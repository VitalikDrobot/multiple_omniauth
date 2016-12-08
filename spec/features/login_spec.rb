require 'rails_helper'

feature 'Login' do	
	context 'valid params' do
		before(:each) do
			OmniAuth.config.mock_auth[:vkontakte] = OmniAuth::AuthHash.new(
      	provider: 'vkontakte',
       	uid: '16583',
        info: { email: 'Vitalik_Drobot@mail.ru' }
      )
      visit root_path
			click_link 'VK'
		end

		scenario 'user login' do	
			expect(page).to have_content('Vitalik_Drobot@mail.ru')
		end

		scenario 'user logout' do
    	click_link 'Logout'
    	expect(page).to_not have_content('Logout')
    end		
	end

	context 'invalid params' do
		scenario 'user login' do 
			OmniAuth.config.mock_auth[:vkontakte] = :invalid_credentials
			visit root_path
      click_link 'VK'
      expect(page).to_not have_content('Logout')
		end
	end
end