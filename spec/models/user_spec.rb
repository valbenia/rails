require 'rails_helper'

RSpec.describe User, type: :model do
  it 'lastname invalid' do
    user = User.create(
      first_name: "Huy",
      last_name: nil,
      email: "heo@gmail.com",
      password:"11121"
    )
    
    expect(user).to_not be_valid
  end

  it 'full name invalid' do
    user = User.create(
      first_name:nil,
      last_name: nil,
      email: "heo@gmail.com",
      password:"11121"
    )
    
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it 'full name invalid' do
    user = User.create(
      first_name:"huy",
      last_name: "nguyen",
      email: "heo@gmail.com",
      password:"11121"
    )
    expect(user.name).to eq"huy nguyen"

  end
end
