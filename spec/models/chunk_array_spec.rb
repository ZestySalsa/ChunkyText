require 'spec_helper'

describe ChunkyText::Chunker do
  let(:long_text) { Faker::Lorem.paragraph(30) }

  describe '.chunk_array' do
    it '[returns an array]' do
      array = ChunkyText::Chunker.chunk_array(long_text, 140)
      expect(array).to be_a(Array)
    end

    it '[each element in the array is a string]' do
      array = ChunkyText::Chunker.chunk_array(long_text, 140)
      expect(array.flatten).to include(long_text)
    end

    it '[each element is <= the max_length]' do
      array = ChunkyText::Chunker.chunk_array(long_text, 140)
      array.each do |elem|
        expect(elem.length).to be <= 140
      end
    end
  end
end
