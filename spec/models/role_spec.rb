require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) do
    Role.create(name: "Customer")
  end

  it 'is valid' do
    expect(role).to be_valid
  end

  it 'is invalid without a name' do
    role.name = nil
    expect(role).to_not be_valid
  end

  it 'is unique' do
    role_1 = Role.create(name: "Customer")
    role_2 = Role.create(name: "Customer")

    expect(role_1).to be_valid
    expect(role_2).to_not be_valid
  end
end
