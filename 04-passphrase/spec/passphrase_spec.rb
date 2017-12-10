require 'passphrase'

RSpec.describe Passphrase do
  context 'part one' do
    context 'phrase is aa bb cc dd ee' do
      phrase_text = 'aa bb cc dd ee'
      phrase = Passphrase.new(phrase_text)
      it 'is valid' do
        expect(phrase.valid).to be true
      end
    end

    context 'phrase is aa bb cc dd aa' do
      phrase_text = 'aa bb cc dd aa'
      phrase = Passphrase.new(phrase_text)
      it 'is invalid' do
        expect(phrase.valid).to be false
      end
    end

    context 'phrase is aa bb cc dd aaa' do
      phrase_text = 'aa bb cc dd aaa'
      phrase = Passphrase.new(phrase_text)
      it 'is valid' do
        expect(phrase.valid).to be true
      end
    end
  end
end
