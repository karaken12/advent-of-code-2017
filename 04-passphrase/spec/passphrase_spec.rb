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

  context 'part two' do
    context 'simple phrase' do
      phrase_text = 'aibcde fghij'
      phrase = Passphrase.new(phrase_text)
      it 'is valid' do
        expect(phrase.valid).to be true
      end
    end

    context 'one word anagramed' do
      phrase_text = 'abcde xyz ecdab'
      phrase = Passphrase.new(phrase_text)
      it 'is invalid' do
        expect(phrase.valid).to be false
      end
    end

    context 'phrase with matching substrings' do
      phrase_text = 'a ab abc abd abf abj'
      phrase = Passphrase.new(phrase_text)
      it 'is valid' do
        expect(phrase.valid).to be true
      end
    end

    context 'phrase with similar but different letters' do
      phrase_text = 'iiii oiii ooii oooi oooo'
      phrase = Passphrase.new(phrase_text)
      it 'is valid' do
        expect(phrase.valid).to be true
      end
    end

    context 'phrase with all words the same' do
      phrase_text = 'oiii ioii iioi iiio'
      phrase = Passphrase.new(phrase_text)
      it 'is invalid' do
        expect(phrase.valid).to be false
      end
    end
  end
end
