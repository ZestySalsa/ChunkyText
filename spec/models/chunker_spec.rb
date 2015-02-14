require 'spec_helper'

describe ChunkyText::Chunker do
  let(:punctuation_mark) { ['!','?','.'].sample }
  let(:long_text) { Faker::Lorem.paragraph(30) }
  
  let(:string_with_punctuation_before_140_chars) do
    string = Faker::Lorem.characters(130)
    string + punctuation_mark + string 
  end
  
  let(:string_with_punctuation_at_140_chars) do
    string = Faker::Lorem.characters(139)
    string + punctuation_mark
  end

  let(:string_with_no_punctuation_before_140_chars) do
    string = Faker::Lorem.characters(150)
  end

  describe '#get_chunk' do
    it '[returns a string]' do
      text = ChunkyText::Chunker.new(long_text, 140)
      expect(text.get_chunk).to be_a(String)
    end

    it '[returns a string <= the max length]' do
      text = ChunkyText::Chunker.new(long_text, 140)
      expect(text.get_chunk.length).to be <= 140
    end


    context '[a punctuation mark occurs before the max length character]' do
      it '[returns a string < the max length]' do
        text = ChunkyText::Chunker.new(string_with_punctuation_before_140_chars, 140)
        expect(text.get_chunk.length).to be < 140
      end

      it '[returns a string that ends in a punctuation mark]' do
        text = ChunkyText::Chunker.new(long_text, 140)
        expect(['!','?','.']).to include(text.get_chunk[-1]) 
      end
    end

    context '[a punctuation mark occurs at the max length character]' do
      it '[returns a string == the max length]' do
        text = ChunkyText::Chunker.new(string_with_punctuation_at_140_chars, 140)
        expect(text.get_chunk.length).to eq(140)
      end
    end

    context '[there is no punctuation mark within the max length]' do
      it '[returns a string == the max length]' do
        text = ChunkyText::Chunker.new(string_with_no_punctuation_before_140_chars, 140)
        expect(text.get_chunk.length).to eq(140)
      end
    end


  end

  describe '#chunk_array' do
    it '[returns an array]' do
      array = ChunkyText::Chunker.new(long_text, 140).chunk_array
      expect(array).to be_a(Array)
    end

    it '[each element in the array is a string]' do
      array = ChunkyText::Chunker.new(long_text, 140).chunk_array
      array.each do |elem|
        expect(elem).to be_a(String)
      end
    end

    it '[each element is <= the max_length]' do
      array = ChunkyText::Chunker.new(long_text, 140).chunk_array
      array.each do |elem|
        expect(elem.length).to be <= 140
      end
    end
  end
end
