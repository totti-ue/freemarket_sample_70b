require 'rails_helper'

RSpec.describe Card, type: :model do

  describe "#create" do
    let!(:user) {create(:user)}

    context 'can save' do
    end

    context 'cannot save' do
    end

  end
end
