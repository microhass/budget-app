require 'rails_helper'

RSpec.describe Entity, type: :model do
  before do
    @author = User.new(name: 'John Doe')
    @group = Group.new(name: 'Group', icon: 'icon.jpg', user: @user)
  end

  it 'is not valid without a group' do
    entity = Entity.new(name: 'Entity', amount: 30, author_id: 1, groups: [])
    expect(entity).to_not be_valid
  end

  it 'is not valid without a name' do
    entity = Entity.new(amount: 30, author_id: 1, groups: [])
    expect(entity).to_not be_valid
  end

  it 'is not valid without an amount' do
    entity = Entity.new(name: 'Entity', author_id: 1, groups: [])
    expect(entity).to_not be_valid
  end

  it 'is not valid without an author' do
    entity = Entity.new(name: 'Entity', amount: 30, groups: [])
    expect(entity).to_not be_valid
  end
end
