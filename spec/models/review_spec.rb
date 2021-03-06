require 'rails_helper'

RSpec.describe Review do
  it { should belong_to(:user) }
  it { should belong_to(:pokemon) }
  it { should validate_presence_of(:body) }
  it { should validate_numericality_of(:rating) }
end
