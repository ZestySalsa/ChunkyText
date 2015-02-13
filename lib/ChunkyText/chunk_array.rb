module ChunkyText
  class Chunker 
    
    def self.chunk_array(string, max_length)
      array = []
      
      while string.length > 0 do
        text_chunk = ChunkyText::Chunker.new(string, max_length)
        array << text_chunk
        string.slice!(0..max_length)
      end

      array
    end
  end
end