require 'spec_helper'

describe Rumeme::SmsInterface, vcr: {cassette_name: 'm4u', match_requests_on: [:method, :uri, :body]} do
  before(:each) do
    Rumeme.configure do |config|
      config.username = 'USERNAME'
      config.password = 'SECRET'
      config.use_message_id = true
      config.secure = true
    end

    @si = Rumeme::SmsInterface.new
  end

  describe "#send_messages!" do
    it "doesn't raise exception when message sent sucessfully" do
      add_success_message
      expect{@si.send_messages!}.to_not raise_error
    end

    it "raises exception when message sent sucessfully" do
      add_fail_message
      expect{@si.send_messages!}.to raise_error(Rumeme::SmsInterface::BadServerResponse, 'error during sending messages')
    end
  end

  describe "#send_messages" do
    it "returns true when messages have been sucessfully sent" do
      add_success_message
      expect(@si.send_messages).to be_true
    end

    it "returns false when messages deliver has been failed" do
      add_fail_message
      expect(@si.send_messages).to be_false
    end
  end

  it '#clear_messages clears messages from the list' do
    add_success_message
    add_success_message
    @si.clear_messages

    expect(@si.send_messages).to be_true
  end

  # todo: it returns when empty
  # todo: it doesn't send any request

  it '#confirm_replies_received sends confirm request' do
    # expect(@si).to recieve(:confirm_replies_received)
    response_message, response_code = @si.confirm_replies_received
    expect(response_code).to eq(100)
  end

  def add_success_message
    @si.add_message phone_number: '11234567', message: 'ok message text'
  end

  def add_fail_message
    @si.add_message phone_number: '11234567', message: 'fail message text'
  end
end
