require 'spec_helper'

require 'hyde/version'
require 'hyde/helpers'

describe Hyde do
  context 'Version number' do
    it 'Has a version number' do
      expect(Hyde::VERSION).not_to be_nil
      expect(Hyde::VERSION.class).to be String
    end
  end 

  context 'Slugs have constraints' do
    it 'Is lower case' do
      expect(Hyde::Helpers.slugify('YELL')).to eq('yell')
    end

    it 'Has dashes instead of spaces' do
      expect(Hyde::Helpers.slugify('Several Word Title')).to eq('several-word-title')
    end

    it 'Does not have punctuation' do
      expect(Hyde::Helpers.slugify('"Why?" He Yelled!')).to eq('why-he-yelled')
    end

    it 'Does not start with an article' do
      expect(Hyde::Helpers.slugify('The Quick Brown Fox')).to eq('quick-brown-fox')
    end

    it 'Does not contain articles' do
      expect(Hyde::Helpers.slugify('Quickly The Brown Fox A Crossed Street')).to eq('quickly-brown-fox-crossed-street')
    end

    it 'Does not end with an article' do
      expect(Hyde::Helpers.slugify('Quick Brown Fox Crossed Street, The')).to eq('quick-brown-fox-crossed-street')
    end
  end
end
