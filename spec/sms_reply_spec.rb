require 'spec_helper'

describe Rumeme::SmsReply do

  context ".parse for reply with id" do
    before(:all) do
      @sms_reply = Rumeme::SmsReply.parse("12 79270123456 100 asdfgh")
    end

    it "correctly parses message id" do
      expect(@sms_reply.message_id).to eq(12)
    end

    it "correctly parses phone number" do
      expect(@sms_reply.phone_number).to eq('79270123456')
    end

    it "correctly parses when" do
      expect(@sms_reply.when).to eq(100)
    end

    it "correctly parses message text" do
      expect(@sms_reply.message).to eq('asdfgh')
    end

    it "assign NONE status" do
      expect(@sms_reply.status).to eq(Rumeme::MessageStatus::NONE)
    end
  end

  context ".parse for reply with id, phone with +" do
    before(:all) do
      @sms_reply = Rumeme::SmsReply.parse("39 +79270123456 35 105")
    end

    it "correctly parses message id" do
      expect(@sms_reply.message_id).to eq(39)
    end

    it "correctly parses phone number" do
      expect(@sms_reply.phone_number).to eq('79270123456')
    end

    it "correctly parses when" do
      expect(@sms_reply.when).to eq(35)
    end

    it "correctly parses message text" do
      expect(@sms_reply.message).to eq('105')
    end

    it "assign NONE status " do
      expect(@sms_reply.status).to eq(Rumeme::MessageStatus::NONE)
    end
  end

  context ".parse for reply without id" do
    before(:all) do
      @sms_reply = Rumeme::SmsReply.parse("79270123456 100 asdfgh")
    end

    it "assigns nil for message id" do
      expect(@sms_reply.message_id).to be_nil
    end

    it "correctly parses phone number" do
      expect(@sms_reply.phone_number).to eq('79270123456')
    end

    it "correctly parses when" do
      expect(@sms_reply.when).to eq(100)
    end

    it "correctly parses message text" do
      expect(@sms_reply.message).to eq('asdfgh')
    end

    it "assigns NONE status" do
      expect(@sms_reply.status).to eq(Rumeme::MessageStatus::NONE)
    end
  end


  context ".parse for delivery report: pending" do
    before(:all) do
      @sms_reply = Rumeme::SmsReply.parse("12 1 100")
    end

    it "correctly parses message id" do
      expect(@sms_reply.message_id).to eq(12)
    end

    it "correctly parses when" do
      expect(@sms_reply.when).to eq(100)
    end

    it "assigns PENDING status" do
      expect(@sms_reply.status).to eq(Rumeme::MessageStatus::PENDING)
    end
  end

  context ".parse for bad data" do
    it "raises ArgumentError" do
      expect { Rumeme::SmsReply.parse("jzxhcjkvhiusdfyhg") }.
        to raise_error(ArgumentError, /can't parse line: jzxhcjkvhiusdfyhg/)
    end
  end
end
