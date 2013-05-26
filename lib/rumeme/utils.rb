module Rumeme
  module Utils
    class << self
      def split_message(message)
        messages = split_message_internal(message)
        message_index = 1
        total_messages = messages.size
        ["#{messages[0]}...(1/#{total_messages})"].concat(messages[1..-1].map {|msg| "(#{message_index+=1}/#{total_messages})#{msg}"})
      end

      # Strip invalid characters from the phone number.
      def strip_invalid(phone)
        "+#{phone.gsub(/[^0-9]/, '')}" if phone
      end

      private

      def head_tail_split(message, max_len)
        return [message, nil] if message.length < max_len
        pattern = /\s\.,!;:-\)/
        index = message[0..max_len].rindex(pattern) || max_len
        [message[0..index], message[index+1 .. -1]]
      end

      def split_message_internal(message)
        list = []
        sizes = Enumerator.new {|yielder| yielder << 152; yielder << 155 while true}

        until message.nil? do
          head, message = head_tail_split(message, sizes.next)
          list << head
        end

        list
      end
    end
  end
end