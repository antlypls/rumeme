require 'spec_helper'

describe Rumeme::MessageStatus do
  it 'correctly assigns constants' do
    expect(Rumeme::MessageStatus::NONE).to eq(0)
    expect(Rumeme::MessageStatus::PENDING).to eq(1)
    expect(Rumeme::MessageStatus::DELIVERED).to eq(2)
    expect(Rumeme::MessageStatus::FAILED).to eq(3)
  end
end
