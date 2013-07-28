require 'spec_helper'

describe 'Gem' do
  it "has Version constant" do
    expect(Rumeme.const_defined?(:VERSION)).to be_true
  end
end
