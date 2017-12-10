require 'captcha'

RSpec.describe Captcha do
  context '1122' do
    it 'sums to 3' do
      captcha = Captcha.new('1122')
      expect(captcha.sum).to eq 3
    end
  end

  context '1111' do
    it 'sums to 4' do
      captcha = Captcha.new('1111')
      expect(captcha.sum).to eq 4
    end
  end

  context '1234' do
    it 'sums to 0' do
      captcha = Captcha.new('1234')
      expect(captcha.sum).to eq 0
    end
  end

  context '91212129' do
    it 'sums to 9' do
      captcha = Captcha.new('91212129')
      expect(captcha.sum).to eq 9
    end
  end

end
