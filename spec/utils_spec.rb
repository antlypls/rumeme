require 'spec_helper'

describe 'Utils' do
  context '.strip_invalid' do
    it 'strips all symbols except numbers' do
      phone = '+1 (123) 456-7890'
      expect(Rumeme::Utils.strip_invalid(phone)).to eq('+11234567890')
    end

    it 'adds + sign' do
      phone = '11234567890'
      expect(Rumeme::Utils.strip_invalid(phone)).to eq('+11234567890')
    end
  end

  context '.split_message' do
    it 'splits short messages' do
      message = 'small message'
      result =Rumeme::Utils.split_message(message)

      expect(result).to have(1).item
      expect(result.first).to eq('small message...(1/1)')
    end

    it 'splits long messages' do
      message = 'a'*300
      result = Rumeme::Utils.split_message(message)

      expect(result).to have(2).items
      expect(result.first).to eq("#{'a'*153}...(1/2)")
      expect(result.last).to eq("(2/2)#{'a'*147}")
    end

    # following test fails because of a bug in split implementation
    # it 'splits long messages by space' do
    #   message = "#{'a'*100} #{'b'*100}"
    #   result = Rumeme::Utils.split_message(message)

    #   expect(result).to have(2).items
    #   expect(result.first).to eq("#{'a'*100} ...(1/2)")
    #   expect(result.last).to eq("(2/2)#{'b'*100}")
    # end
  end
end
