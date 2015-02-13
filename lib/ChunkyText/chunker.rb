module ChunkyText
  class Chunker
    
    attr_reader :max_length, :chunk_array, :get_chunk
    attr_accessor :string

    def initialize(string, max_length)
      @string = string
      @max_length = max_length
    end 

    def get_chunk
      smaller_string = string.slice(0,max_length)
      smaller_string.slice(0,last_punctuation_mark(smaller_string) + 1)
    end

    def chunk_array
      input_string = string.clone
      array = []
      while input_string.length > 0 do
        array << get_chunk
        
        input_string.slice!(0..max_length)
      end
      input_string = string.clone
      array
    end

    private

    def last_punctuation_mark(string)
      punctuation_mark_positions = []
      ['!','?','.'].each do |p_mark|
        punctuation_mark_positions <<  string.rindex(p_mark)
      end
      punctuation_mark_positions.reject! { |item| item == nil }
      punctuation_mark_positions.max
    end
  end
end