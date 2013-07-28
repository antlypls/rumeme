require 'spec_helper'

describe 'SmsMessage' do
  context 'constructor' do
    it 'correctly assigns all parameters' do
      sms = Rumeme::SmsMessage.new :phone_number => "12345678901",
                                   :message => "qwertasdfzxcv",
                                   :message_id => 100,
                                   :delay => 10,
                                   :validity_period => Rumeme::ValidityPeriod::MINIMUM,
                                   :delivery_report => true

      expect(sms.phone_number).to eq("12345678901")
      expect(sms.message).to eq("qwertasdfzxcv")
      expect(sms.message_id).to eq(100)
      expect(sms.delay).to eq(10)
      expect(sms.validity_period).to eq(Rumeme::ValidityPeriod::MINIMUM)
      expect(sms.delivery_report).to eq(true)
    end

    it "correctly assigns default values" do
      sms = Rumeme::SmsMessage.new :phone_number => "12345678901",
                                   :message => "qwertasdfzxcv"

      expect(sms.phone_number).to eq("12345678901")
      expect(sms.message).to eq("qwertasdfzxcv")
      expect(sms.message_id).to eq(0)
      expect(sms.delay).to eq(0)
      expect(sms.validity_period).to eq(Rumeme::ValidityPeriod::THREE_DAYS)
      expect(sms.delivery_report).to eq(false)
    end

    it "raise ArgumentError if phone number is not provided" do
      expect { Rumeme::SmsMessage.new :message => "qwertasdfzxcv" }.
        to raise_error(ArgumentError, /phone_number is empty/)
    end

    it "raise ArgumentError if phone number is empty" do
      expect { Rumeme::SmsMessage.new :phone_number => "", :message => "qwertasdfzxcv" }.
        to raise_error(ArgumentError, /phone_number is empty/)
    end

    it "raise ArgumentError if message is not provided" do
      expect { Rumeme::SmsMessage.new :phone_number => "12345678901" }.
        to raise_error(ArgumentError, /message is empty/)
    end

    it "raise ArgumentError if message is empty" do
      expect { Rumeme::SmsMessage.new :phone_number => "12345678901", :message => "" }.
        to raise_error(ArgumentError, /message is empty/)
    end
  end
end
