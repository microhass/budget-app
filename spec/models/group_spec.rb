require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = User.new(name: 'John Doe')
  end

  it 'is valid with valid attributes' do
    group = Group.new(name: 'Group', icon: 'icon.jpg', user: @user)
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = Group.new(icon: 'icon.jpg', user_id: @user.id)
    expect(group).to_not be_valid
  end

  it 'is not valid without an icon' do
    group = Group.new(name: 'Group', user_id: @user.id)
    expect(group).to_not be_valid
  end

  it 'is not valid without a user' do
    group = Group.new(name: 'Group', icon: 'icon.jpg')
    expect(group).to_not be_valid
  end
end
