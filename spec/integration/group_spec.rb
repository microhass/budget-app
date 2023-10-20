require 'rails_helper'

RSpec.feature 'Group Index Page' do
  let(:user) { User.create(name: 'Jane', email: 'jane@doe.com', password: '123456') }

  describe 'Testing integration specs for groups index page' do
    before :each do
      Group.create(name: 'Group 1', icon: 'https://cdn.iconscout.com/icon/free/png-256/ruby-47-1175102.png',
                   user:)
      login_as(user, scope: :user)
      visit groups_path
    end

    context 'When visiting groups path' do
      it 'can see group name' do
        expect(page).to have_content('Group 1')
      end

      it 'can see group icon' do
        expect(page).to have_css("img[src='https://cdn.iconscout.com/icon/free/png-256/ruby-47-1175102.png']")
      end

      it 'can see link to add new group' do
        expect(page).to have_link('Add new category', href: new_group_path)
      end
    end
  end
end
