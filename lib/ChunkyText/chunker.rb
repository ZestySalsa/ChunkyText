module ChunkyText
  class Chunker

    PREPEND_COUNT = 6
    
    attr_reader :max_length, :chunk_array, :get_chunk, :elipse
    attr_accessor :string

    def initialize(string, max_length, elipse = "(...)")
      @string = string
      @elipse = elipse
      @max_length = max_length - elipse.length - 1
    end 

    # append elipse to end of each chunk
    # (...)
    #140 -5 = text chunk
    # can't split up words.
    # sting = "likasdlkjhalkd jdlka"
    # string[-1] => a
    # take the first 140 -5 
    #
    # check if the last char is /\s/
    # if it is save it as a chunk
    # else

    # (1/8) hsssjhs
    # remove all chars after last /\s/
    # prepend 1 of 5 , 2 of 5 , ....
    #string = "cnaoicncnsdj dcndvcsdnuisvbnuisdbsc sducbsidcubsiucbescebuicbscsec"

    def get_chunk(input_string) 
      smaller_string = input_string.slice(0,max_length - PREPEND_COUNT)

      if last_space(smaller_string)
        smaller_string.slice(0,last_space(smaller_string) + 1)
      else
        smaller_string
      end
    end

    def chunk_array
      input_string = string.clone
      array = []
      while input_string.length > 0 do
        if input_string.length > max_length - PREPEND_COUNT 
          chunk = get_chunk(input_string)
          array <<  chunk + ' ' + elipse
          input_string.slice!(0..chunk.length - 1)
        else
          array << input_string
          break
        end
      end
      input_string = string.clone
      
      array.map!.with_index do |chunk, i|
        "(#{i + 1}/#{array.count}) " + chunk  
      end 
      

      # total_chunks = array.count #=> 100
      # digits = array_count.to_s.length #=> 3
      
      #1/10 chunks
      #100 max chunk

      #grab number of specific chunk in array + "/" + digits
    end

    private

    def last_space(string)
      position = string.rindex /\s/
    end
  end
end