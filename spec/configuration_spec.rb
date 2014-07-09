require 'spec_helper'

describe Rumeme::Configuration do
  before(:all) do
    @rumeme_configuration = Rumeme::Configuration.new
  end

  it 'has username attribute' do
    expect(@rumeme_configuration).to respond_to(:username)
  end

  it 'has password attribute' do
    expect(@rumeme_configuration).to respond_to(:password)
  end

  it 'has use_message_id attribute' do
    expect(@rumeme_configuration).to respond_to(:use_message_id)
  end

  it 'has secure attribute' do
    expect(@rumeme_configuration).to respond_to(:secure)
  end

  it 'has replies_auto_confirm attribute' do
    expect(@rumeme_configuration).to respond_to(:replies_auto_confirm)
  end

  it 'has long_messages_strategy attribute' do
    expect(@rumeme_configuration).to respond_to(:long_messages_strategy)
  end
end
