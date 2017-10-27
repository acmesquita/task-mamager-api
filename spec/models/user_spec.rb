require 'rails_helper'

RSpec.describe User, type: :model do
     
  let(:user) { build(:user) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to allow_value('catharina@catha.com').for(:email) }

end

## Examples ##
#pending 'add some examples to (or delete) #{__FILE__}'
  # subject { build(:user) }
  # before {@user = FactoryBot.build(:user)}

  # it { expect(@user).to respond_to(:name) }
  # it { expect(@user).to respond_to(:password) }
  # it { expect(@user).to respond_to(:password_confirmation) }
  # it { expect(@user).to be_valid  }
  
  # it { expect(subject).to be_valid  }
  
  # Três formas de fazer o mesmo teste
  # it { expect(@user).to respond_to(:email) }
  # it { expect(subject).to respond_to(:email) }
  # it { is_expected.to respond_to(:email) }

  
  
  # context 'when name is blank' do
    
    #   before { user.name = ' ' }
    
    #   it { expect(user).not_to be_valid }
    # end
    
    # context 'when name is nil' do
      
      #       before { user.name = nil }
      
      #       it { expect(user).not_to be_valid }
      # end