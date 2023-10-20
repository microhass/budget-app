require 'rails_helper'

RSpec.feature 'User Index Page' do
  let(:user) { User.create(name: 'Jane', email: 'jane@doe.com', password: '123456') }

  describe 'Testing integration specs for users index page' do
    before :each do
      login_as(user, scope: :user)
      visit groups_path
    end

    context 'When visiting users path' do
      it 'can see user login info' do
        expect(page).to have_content('Logged in as jane@doe.com')
      end

      it 'can see logout button' do
        expect(page).to have_button('Logout')
      end
    end
  end
end
