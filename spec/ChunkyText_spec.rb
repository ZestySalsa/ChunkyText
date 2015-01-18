require 'spec_helper'

describe ChunkyText do
  let(:long_text) { Faker::Lorem.paragraph(10) }
  
  describe '.chunk(string, max_length)' do
    it '[returns an array]' do
      expect(ChunkyText.chunk(long_text, 140)).to be_a(Array)
    end

    it '[all elements of array are strings equal or less than max length]' do
      result = ChunkyText.chunk(long_text, 140)
      chunks = (long_text.length / 140).to_i
      counter = 0
      chunks.times do
        expect(result[counter].length).to be <= 140
        counter += 1
      end
    end
  end
end
