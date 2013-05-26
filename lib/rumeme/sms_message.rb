module Rumeme
  # This class represents an SMS message.
  class SmsMessage
    attr_reader :phone_number, :message, :message_id, :delay, :validity_period, :delivery_report

    # this defaults must be moved to global configuration
    DEFAULTS = {
      :phone_number => nil,
      :message => nil,
      :message_id => 0,
      :delay => 0,
      :validity_period => ValidityPeriod::THREE_DAYS,
      :delivery_report => false
    }.freeze

    # Constructor.
    def initialize(args)
      params = DEFAULTS.merge(args)
      DEFAULTS.keys.each {|key| instance_variable_set(:"@#{key}", params[key])}

      check_attributes

      @message = @message.gsub("\n",'\n').gsub("\r",'\r').gsub("\\",'\\\\')
    end

    def post_string
      "#{@message_id} #{@phone_number} #{@delay} #{@validity_period} #{@delivery_report ? 1 : 0} #{@message}\r\n"
    end

    private

    def check_attributes
      raise ArgumentError.new("phone_number is empty") if @phone_number.blank?
      raise ArgumentError.new("message is empty") if @message.blank?
    end
  end
end
