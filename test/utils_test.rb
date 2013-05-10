$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "..", "lib"))
require 'test/unit'
require "rubygems"
require 'shoulda'
require "rumeme"

class UtilsTest < Test::Unit::TestCase
  context 'Utils::strip_invalid' do
    should 'strips all symbols except numbers' do
      phone = '+1 (123) 456-7890'
      assert_equal '+11234567890', Utils.strip_invalid(phone)
    end

    should 'add + sign' do
      phone = '11234567890'
      assert_equal '+11234567890', Utils.strip_invalid(phone)
    end
  end

  # crazy test it checks [wrong] current behaviour, that it splits even short messages
  # 'small message' -> 'small message...(1/1)'
  # split_message should be fixed
  context 'Utils::split_message' do
    should 'split short messages' do
      message = 'small message'

      result = Utils.split_message(message)
      assert_equal 1, result.size
      assert_equal 'small message...(1/1)', result.first
    end
  end

  context 'Utils::split_message' do
    should 'split long messages' do
      message = 'a'*300

      result = Utils.split_message(message)
      assert_equal 2, result.size
      assert_equal "#{'a'*153}...(1/2)", result.first
      assert_equal "(2/2)#{'a'*147}", result.last
    end
  end

  # following test fails because bug in split implementation
  # context 'Utils::split_message' do
  #   should 'split long messages by space' do
  #     message = "#{'a'*100} #{'b'*100}"

  #     result = Utils.split_message(message)
  #     assert_equal 2, result.size
  #     assert_equal "#{'a'*100} ...(1/2)", result.first
  #     assert_equal "(2/2)#{'b'*100}", result.last
  #   end
  # end

end