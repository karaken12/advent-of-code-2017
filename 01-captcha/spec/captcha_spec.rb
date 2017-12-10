require 'captcha'

RSpec.describe Captcha do
  context 'when considering neighbours' do
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

  context 'when cosidering halfways' do
    context '1212' do
      it 'sums to 6' do
        captcha = Captcha.new('1212', halfway: true)
        expect(captcha.sum).to eq 6
      end
    end

    context '1221' do
      it 'sums to 0' do
        captcha = Captcha.new('1221', halfway: true)
        expect(captcha.sum).to eq 0
      end
    end

    context '123425' do
      it 'sums to 4' do
        captcha = Captcha.new('123425', halfway: true)
        expect(captcha.sum).to eq 4
      end
    end

    context '123123' do
      it 'sums to 12' do
        captcha = Captcha.new('123123', halfway: true)
        expect(captcha.sum).to eq 12
      end
    end

    context '12131415' do
      it 'sums to 4' do
        captcha = Captcha.new('12131415', halfway: true)
        expect(captcha.sum).to eq 4
      end
    end
  end
end
