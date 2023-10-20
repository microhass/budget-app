require 'rails_helper'

RSpec.feature 'Entity Index Page' do
  let(:user) { User.create(name: 'Jane', email: 'jane@doe.com', password: '123456') }
  let(:group) { Group.create(name: 'Group 1', icon: 'https://cdn.iconscout.com/icon/free/png-256/ruby-47-1175102.png', user:) }

  describe 'Testing integration specs for entities index page' do
    before :each do
      Entity.create(name: 'Entity 1', amount: 100, group_ids: [group.id])
      login_as(user, scope: :user)
      visit group_path(group)
    end

    context 'When visiting entities path' do
      it 'can see entity name' do
        expect(page).to have_content('Entity 1')
      end

      it 'can see entity amount' do
        expect(page).to have_content('$100.0')
      end

      it 'can see link to add new entity' do
        expect(page).to have_link('Add a new transaction', href: new_group_entity_path(group))
      end
    end
  end
end
